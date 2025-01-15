```sql
CREATE TABLE Emp (
    EmpNo NUMBER(10),
    EName VARCHAR(255),
    Job VARCHAR(25),
    Salary NUMBER(7),
    Commission NUMBER(7),
    DeptNo NUMBER(3)
);

INSERT INTO Emp VALUES (1, 'Himanshu', 'IT Manager', 10000, 1000, 1);
INSERT INTO Emp VALUES (1, 'Nitish', 'Manager', 20000, NULL, 15);
INSERT INTO Emp VALUES (3, 'Angad', 'CEO', 999999, NULL, 10);
INSERT INTO Emp VALUES (4, 'Arnav', 'Clerk', 100000, 10000, 12);
INSERT INTO Emp VALUES (5, 'Harith Khanna', 'Clerk', 120000, 12000, 12);

SELECT EmpNo, EName FROM Emp WHERE DeptNo = 10;

SELECT EName FROM Emp WHERE Job = 'Clerk' AND Salary > 2000;

SELECT EName, Job FROM Emp WHERE Job IN ('Salesperson', 'Clerk');

SELECT * FROM Emp WHERE Salary BETWEEN 2000 AND 3000;

SELECT * FROM Emp WHERE DeptNo IN (10,20,30);

SELECT Ename FROM Emp WHERE Commission IS NULL;

SELECT DeptNo, Salary FROM Emp ORDER BY DeptNo ASC, SALARY DESC; 

SELECT EName FROM Emp WHERE EName LIKE '%a%a%' OR EName LIKE '%A%A%';

SELECT EName FROM Emp WHERE EName LIKE '_b%' OR EName LIKE '_B%';

SELECT EName FROM Emp WHERE EName LIKE 'a%' OR EName LIKE 'A%' OR EName LIKE '%A' OR EName LIKE '%a';

SELECT MAX(Salary), MIN(Salary), AVG(Salary) FROM Emp WHERE DeptNo = 10;

SELECT COUNT(*) FROM Emp WHERE DeptNo = 20;

SELECT SUM(Salary) FROM Emp WHERE Job = 'Clerk';

SELECT CURRENT_DATE FROM Emp;

SELECT (12*12/13) FROM Emp;

SELECT * FROM Emp WHERE UPPER(Ename) = UPPER('raj');
```
