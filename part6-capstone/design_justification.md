# Design Justification

## Storage Systems

For transactional data — things like patient admissions, billing records, and ICU readings — I went
with a PostgreSQL/MySQL OLTP database. These are battle-tested relational databases that handle
high-frequency reads and writes well, and healthcare data is deeply relational by nature (a patient
ties to appointments, which tie to billing, which tie to doctors). Strong ACID compliance here isn't
optional; you genuinely can't afford inconsistent writes in a clinical setting.

The Data Lake sits downstream and stores raw, unstructured data — medical images, JSON payloads from
devices, unprocessed logs. The idea is to land everything first and figure out the shape later.
S3-compatible object storage works well here because it's cheap, scalable, and doesn't force you to
define a schema upfront.

The Data Warehouse (think Snowflake or BigQuery) is where the cleaned, structured data lives for
analytics and reporting. It's column-oriented, which makes aggregation queries dramatically faster —
exactly what you need when a hospital administrator wants to see average length of stay across 50,000
patients over two years.

The Vector Database is specifically there to support the AI layer — it stores embeddings of patient
records so the LLM can do semantic search. When a doctor asks "show me similar cases to this
patient," you can't do that with SQL. You need vector similarity search, and a dedicated store like
Pinecone or pgvector handles that cleanly.

## OLTP vs OLAP Boundary

The boundary sits right at the ETL pipeline. Everything before it — the hospital systems feeding
into PostgreSQL/MySQL — is transactional. It's optimized for single-record lookups, fast inserts,
and data integrity. The moment data crosses into the ETL layer, it gets cleaned, transformed, and
restructured for analytical use. From the Data Lake onward, nothing is being written to in real
time. It's read-heavy, batch-oriented, and built for querying large volumes rather than individual
transactions.

## Trade-offs

The biggest trade-off here is latency vs. freshness in the analytical layer. Because the Data
Warehouse is populated through batch ETL jobs, the data a doctor or manager sees in a dashboard
might be hours old. In most analytics contexts that's fine, but in a hospital, some decisions
move fast.

The mitigation I'd lean on is a two-track approach — keep the batch pipeline for heavy reporting,
but add a lightweight streaming layer (like Kafka or Debezium) that pushes critical real-time
signals — say, ICU alerts or abnormal lab results — directly to the application layer without
waiting for the next ETL run. You don't need to stream everything; just the data where staleness
actually has consequences. That way you preserve the simplicity of the batch architecture for most
use cases while covering the edge cases that genuinely need speed.