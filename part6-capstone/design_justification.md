## Storage Systems

In this design, we don't use just one place to store all the hospital's data.
Instead, we use different storage systems for different jobs, because no single
system is good at everything.

For the hospital's everyday work — things like saving patient details, recording
treatments, and handling bills — we use a regular relational database like
PostgreSQL. Think of this like a very organised filing cabinet where every piece
of information has its exact place. This is important for hospital staff because
when a doctor updates a patient's file or a payment is processed, the system
needs to save that information correctly every single time without any mistakes.

We also use something called a data lake. This is basically a big storage space
where we dump all kinds of raw data — like readings from ICU machines, medical
scan images, and old patient records. Unlike the regular database, the data lake
doesn't care much about structure. It just holds everything as it is. This is
useful because hospitals collect huge amounts of different types of data, and
sometimes you don't know yet how you'll use it in the future.

Then there's the data warehouse, which is where all the reporting happens.
Hospital managers use this to answer questions like "How many beds were occupied
last month?" or "Which department spent the most money?" Data from the other
systems gets cleaned up and moved into the warehouse so it's ready for analysis.
It's designed to handle these kinds of big questions quickly and efficiently.

Finally, we use a vector database to help doctors search through patient records
using normal sentences. So instead of searching for an exact keyword, a doctor
can ask something like "Has this patient ever had a heart problem?" and the
system will understand what they mean and find the right records.

## OLTP vs OLAP Boundary

The OLTP side of the system handles everything that happens in real time —
admissions, treatments, billing, and day-to-day tasks. It needs to be fast
because hospital staff are using it constantly throughout the day.

The OLAP side is the data warehouse. It doesn't deal with live operations.
Instead, data gets copied over from the OLTP systems at regular intervals,
cleaned up, and stored in a way that makes analysis easy. This separation is
very important — if reporting and analysis ran on the same system as live
hospital operations, it would slow everything down for doctors and nurses.

## Trade-offs

The biggest downside of this design is that it's complicated. Running four
different storage systems means more things to manage, more costs, and more
chances for something to go wrong when moving data between systems.

But the benefit is that each system does its job really well. The hospital can
handle large amounts of data, run fast transactions, produce useful reports, and
support smart search — all at the same time.