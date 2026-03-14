## Vector DB Use Case

A traditional keyword-based database search may not work well for searching large legal contracts. These documents can be hundreds of pages long and often use complex legal language. If a lawyer searches using keywords like “termination clause”, the database will only look for exact words. However, legal documents may describe the same idea using different wording. Because of this, keyword search may miss important sections that are written in a different way.

A vector database works differently. Instead of searching for exact words, it converts the text into numerical representations called embeddings. These embeddings capture the meaning of the text. This allows the system to find passages that are semantically similar to the question, even if the exact keywords are not present.

For example, if a lawyer asks “What are the termination clauses?”, the system can search the contract for sections that discuss ending agreements, cancellation terms, or contract termination conditions. Even if those exact words are not used, the vector similarity search can still find relevant sections.

In this system, the contracts would first be split into smaller chunks and converted into embeddings using an embedding model. These embeddings would then be stored in a vector database. When a lawyer asks a question, the question is also converted into an embedding and compared with the stored embeddings. The system returns the most similar text sections from the contract.

This approach makes searching large legal documents much easier and more accurate compared to traditional keyword-based searches.