# DBMS Assignment 1

#### Question 1
**Create a table Student (Rno, Name, DOB, Gender, Class, College, City, Marks)**
```sql
CREATE TABLE Student (
    RNo NUMBER(10),
    Name VARCHAR(255),
    DOB DATE,
    Gender CHAR(1),
    Class VARCHAR(5),
    College VARCHAR(50),
    City VARCHAR(25),
    Marks NUMBER(3)
);
```

**Output:** 
```txt
Table created.
```

---

#### Question 2
**Insert 5 records into the Student table**
```sql
INSERT INTO Student VALUES (102303244, 'Himanshu Sardana', '04-JUN-2005', 'M', '2C21', 'Thapar', 'Patiala', 25);
INSERT INTO Student VALUES (102303243, 'Harith Khanna', '03-JUL-2005', 'M', '2C21', 'Thapar', 'Patiala', 98);
INSERT INTO Student VALUES (102303239, 'Nitish', '02-JAN-2005', 'M', '2C21', 'Thapar', 'Amritsar', 96);
INSERT INTO Student VALUES (102303241, 'Angad Dhawan', '01-JAN-2005', 'M', '2C21', 'Thapar', 'Patiala', 100);
INSERT INTO Student VALUES (102303242, 'Arnav Goyal', '05-MAR-2004', 'M', '2C21', 'Thapar', 'Patiala', 96);
```

**Output:** 
```txt
1 row(s) inserted.
1 row(s) inserted.
1 row(s) inserted.
1 row(s) inserted.
1 row(s) inserted.
```

---

#### Question 3
**Display the information of all the students**
```sql
SELECT * FROM Student;
```

**Output:** 
| RNO       | NAME             | DOB         | Gender | Class | College | City     | Marks |
|-----------|------------------|-------------|--------|-------|---------|----------|-------|
| 102303244 | Himanshu Sardana | 04-JUN-2005 | M      | 2C21  | Thapar  | Patiala  | 25    |
| 102303243 | Harith Khanna    | 03-JUL-2005 | M      | 2C21  | Thapar  | Patiala  | 98    |
| 102303239 | Nitish           | 02-JAN-2005 | M      | 2C21  | Thapar  | Amritsar | 96    |
| 102303241 | Angad Dhawan     | 01-JAN-2005 | M      | 2C21  | Thapar  | Patiala  | 100   |
| 102303242 | Arnav Goyal      | 05-MAR-2004 | M      | 2C21  | Thapar  | Patiala  | 96    |

---

#### Question 4
**Display the detailed structure of the Student table**
```sql
DESCRIBE Student;
```

**Output:** 
| Column    | Null? | Type    |
|-----------|-------|---------|
| RNO       |   -    | NUMBER(10, 0)  |
| NAME      |   -    | VARCHAR2(255)  |
| DOB       |   -    | DATE    |
| Gender   |    -   | CHAR(1) |
| Class     |   -    | VARCHAR2(5)    |
| College   |   -    | VARCHAR2(50)   |
| City      |   -    | VARCHAR2(25)   |
| Marks     |   -    | NUMBER(3, 0)   |

---

#### Question 5
**Display Rno, Name and Class information of 'Patiala' students**
```sql
SELECT RNo, Name, Class FROM Student WHERE City = 'Patiala'
```

**Output:** 
| RNO       | NAME             | Class |
|-----------|------------------|-------|
| 102303244 | Himanshu Sardana | 2C21  |
| 102303243 | Harith Khanna    | 2C21  |
| 102303241 | Angad Dhawan     | 2C21  |
| 102303242 | Arnav Goyal      | 2C21  |

---

#### Question 6
**Display information on ascending order of marks**
```sql
SELECT * FROM Student ORDER BY Marks;
```

**Output:** 
| RNO       | NAME             | DOB         | Gender | Class | College | City     | Marks |
|-----------|------------------|-------------|--------|-------|---------|----------|-------|
| 102303244 | Himanshu Sardana | 04-JUN-2005 | M      | 2C21  | Thapar  | Patiala  | 25    |
| 102303243 | Harith Khanna    | 03-JUL-2005 | M      | 2C21  | Thapar  | Patiala  | 98    |
| 102303239 | Nitish           | 02-JAN-2005 | M      | 2C21  | Thapar  | Amritsar | 96    |
| 102303242 | Arnav Goyal      | 05-MAR-2004 | M      | 2C21  | Thapar  | Patiala  | 96    |
| 102303241 | Angad Dhawan     | 01-JAN-2005 | M      | 2C21  | Thapar  | Patiala  | 100   |

---

#### Question 7
**Change the marks of Rno 5 to 89**
```sql
UPDATE Student SET Marks = 89 WHERE RNo = '102303243';
```

**Output:** 
```txt
1 row(s) updated.
```

---

#### Question 8
**Change the name and city of Rno 9**
```sql
UPDATE Student SET Marks = 90, CITY = 'Delhi' WHERE RNo = '102303244';
```

**Output:** 
```txt
1 row(s) updated.
```

---

#### Question 9
**Delete the information of 'Amritsar' city records.**
```sql
DELETE FROM Student WHERE CITY = 'Amritsar';
```

**Output:** 
```txt
1 row(s) deleted.
```

---

#### Question 10
**Delete the records of students where marks < 30.**
```sql
DELETE FROM STUDENT WHERE MARKS < 30;
```

**Output:** 
```txt
1 row(s) deleted.
```
