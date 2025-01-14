# Database Management Systems

## Basics
### Data
- Data are characteristics or information, usually numerical, that are collected through observation.
- Any facts and figures stored about an entity is called data.

### Information
- Data becomes information when it is processed, interpreted and presented in a meaningful way i.e processed data is called information.

### Database
- A database is a structured collection of data allowing easy access, manipulation and management of data generally stored and accessed electronically from a computer system.

### Database Management System
- A Database Management System (DBMS) is a software package designed to define, manipulate, retrieve and manage data in a database.
- It ensures data safety, security, integrity, accessibility and concurrency.
- It supports functions like data querying, reporting and analysis.

### File System vs DBMS
| Aspect | File System | DBMS |
| --- | --- | --- |
| Data Access | Slower data retrieval due to unstructured querying | Faster data retrieval due to structured querying |
| Data Isolation | Challenges in correlating data across seperate files leading to data isolation | Facilitates data correlation across multiple tables, reducing data isolation |
| Data Integrity | Risk of inadvertent data alterations or deletions creating integrity issues | Ensures data integrity through constraints and referential integrity |
| Atomicity | Potential for data inconsistency due to incomplete operations, leading to atomicity issues | Supports transaction properties like atomicity, ensuring operations are either completed fully or not at all |
| Concurrent Access | Limited support for concurrent data access, leading to data inconsistency | Supports concurrent data access through locking mechanisms, ensuring data consistency |

### Views of Database (Data Abstraction)
- **Physical Level**: Describes how data is stored in the database.
- **Logical Level**: Describes what data is stored in the database and relationships among the data.
- **View Level**: Describes a part of the database that a particular user group is interested in.
