# DBMS Assignment 1

**Q1: Create a table Student (Rno, Name, DOB, Gender, Class, College, City, Marks)**
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

**Q2: Insert 5 records into the Student table**
```sql
INSERT INTO Student VALUES (102303244, 'Himanshu Sardana', '04-JUN-2005', 'M', '2C21', 'Thapar', 'Patiala', 95);
INSERT INTO Student VALUES (102303243, 'Harith Khanna', '03-JUL-2005', 'M', '2C21', 'Thapar', 'Patiala', 98);
INSERT INTO Student VALUES (102303239, 'Nitish', '02-JAN-2005', 'M', '2C21', 'Thapar', 'Patiala', 96);
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

**Q3: Display the information of all the students**
```sql
SELECT * FROM Student;
```

**Output:** 
```txt
Table created.
```

---

**Q4: Display the detailed structure of the Student table**
```sql
DESCRIBE Student;
```

**Output:** 
```txt
Table created.
```

---

**Q5: Display Rno, Name and Class information of 'Patiala' students**
```sql
SELECT RNo, Name, Class FROM Student WHERE City = 'Patiala'
```

**Q6: Display information on ascending order of marks**
```sql
SELECT * FROM Student ORDER BY Marks;
```

**Q7: Change the marks of Rno 5 to 89**
```sql
UPDATE Student SET Marks = 89 WHERE RNo = '102303243';
```

**Q8: Change the name and city of Rno 9**
```sql
UPDATE Student SET Marks = 90, CITY = 'Delhi' WHERE RNo = '102303244';
```

**Q9: Delete the information of 'Amritsar' city records.**
```sql
DELETE FROM Student WHERE CITY = 'Amritsar';
```

**Q10: Delete the records of students where marks < 30.**
```sql
DELETE FROM STUDENT WHERE MARKS < 30;
```
