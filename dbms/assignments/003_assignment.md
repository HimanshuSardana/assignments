### Q1: Use the following functions:
- chr(n)
```sql
SELECT chr(65) FROM dual;
```

**OUTPUT** 
```txt
| CHR(65) |
|---------|
| A       |
```

- concat(char1, char2)
```sql
SELECT concat('Himanshu', ' ', 'Sardana') FROM dual;
```

**OUTPUT** 
```txt
| CONCAT('HIMANSHU',' ','SARDANA') |
|----------------------------------|
| Himanshu Sardana                 |
```

- instr(string, char)
```sql
SELECT instr('Himanshu', 'a') FROM dual;
```

**OUTPUT** 
```txt
| INSTR('HIMANSHU','A') |
|-----------------------|
| 3                     |
```

- length(n)
```sql
SELECT length('Himanshu') FROM dual;
```

**OUTPUT** 
```txt
| LENGTH('HIMANSHU') |
|--------------------|
| 8                  |
```


- lpad (string, length, char)
```sql
SELECT lpad('Himanshu', 10, '*') FROM dual;
```

**OUTPUT** 
```txt
| LPAD('HIMANSHU',10,'*') |
|-------------------------|
| **Himanshu            |
```

- ltrim(string, char)
```sql
SELECT ltrim('Himanshu', 'H') FROM dual;
```

**OUTPUT** 
```txt
| LTRIM('HIMANSHU','H') |
|-----------------------|
| imanshu               |
```

- rpad(string, length, char)
```sql
SELECT rpad('Himanshu', 10, '*') FROM dual;
```

**OUTPUT** 
```txt
| RPAD('HIMANSHU',10,'*') |
|-------------------------|
| Himanshu**            |
```

- rtrim(string, char)
```sql
SELECT rtrim('Himanshu', 'u') FROM dual;
```

**OUTPUT** 
```txt
| RTRIM('HIMANSHU','U') |
|-----------------------|
| Himansh               |
```

- replace(char, search_string, replace_string)
```sql
SELECT replace('Himanshu', 'a', 'A') FROM dual;
```

**OUTPUT** 
```txt
| REPLACE('HIMANSHU','A','A') |
|-----------------------------|
| HimAnshu                    |
```

- substr(string, start, length)
```sql
SELECT substr('Himanshu', 2, 4) FROM dual;
```

**OUTPUT** 
```txt
| SUBSTR('HIMANSHU',2,4) |
|------------------------|
| iman                   |
```

- initcap(char)
```sql
SELECT initcap('himanshu sardana') FROM dual;
```

**OUTPUT** 
```txt
| INITCAP('HIMANSHUSARDANA') |
|----------------------------|
| Himanshu Sardana           |
```

- lower(char)
```sql
SELECT lower('HIMANSHU') FROM dual;
```

**OUTPUT** 
```txt
| LOWER('HIMANSHU') |
|-------------------|
| himanshu          |
```

- upper(char)
```sql
SELECT upper('himanshu') FROM dual;
```

**OUTPUT** 
```txt
| UPPER('HIMANSHU') |
|-------------------|
| HIMANSHU          |
```

- translate(char, search_string, replace_string)
```sql
SELECT translate('Himanshu', 'H', 'h') FROM dual;
```

**OUTPUT** 
```txt
| TRANSLATE('HIMANSHU','H','H') |
|-------------------------------|
| himanshu                      |
```

- abs(n)
```sql
SELECT abs(-10) FROM dual;
```

**OUTPUT** 
```txt
| ABS(-10) |
|----------|
| 10       |
```

- ceil(n)
```sql
SELECT ceil(10.1) FROM dual;
```

**OUTPUT** 
```txt
| CEIL(10.1) |
|------------|
| 11         |
```

- cos(n)
```sql
SELECT cos(0) FROM dual;
```

**OUTPUT** 
```txt
| COS(0) |
|--------|
| 1      |
```

- exp(n)
```sql
SELECT exp(1) FROM dual;
```

**OUTPUT** 
```txt
| EXP(1) |
|--------|
| 2.7183 |
```

- floor(n)
```sql
SELECT floor(10.1) FROM dual;
```

**OUTPUT** 
```txt
| FLOOR(10.1) |
|-------------|
| 10          |
```

- mod(m, n)
```sql
SELECT mod(10, 3) FROM dual;
```

**OUTPUT** 
```txt
| MOD(10,3) |
|-----------|
| 1         |
```

- power(m, n)
```sql
SELECT power(2, 3) FROM dual;
```

**OUTPUT** 
```txt
| POWER(2,3) |
|-----------|
| 8         |
```

- round(n)
```sql
SELECT round(10.1) FROM dual;
```

**OUTPUT** 
```txt
| ROUND(10.1) |
|-------------|
| 10          |
```

- sign(n)
```sql
SELECT sign(-10) FROM dual;
```

**OUTPUT** 
```txt
| SIGN(-10) |
|----------|
| -1       |
```

- sqrt(n)
```sql
SELECT sqrt(9) FROM dual;
```

**OUTPUT** 
```txt
| SQRT(9) |
|---------|
| 3       |
```

- trunc(x, n)
```sql
SELECT trunc(10.123, 2) FROM dual;
```

**OUTPUT** 
```txt
| TRUNC(10.123,2) |
|----------------|
| 10.12          |
```

- sysdate;
```sql
SELECT sysdate FROM dual;
```

**OUTPUT** 
```txt
22-JAN-25
```

- greatest(expr)
```sql
SELECT greatest(10, 20, 30) FROM dual;
```

**OUTPUT** 
```txt
| GREATEST(10,20,30) |
|--------------------|
| 30                 |
```

- least(expr)
```sql
SELECT least(10, 20, 30) FROM dual;
```

**OUTPUT** 
```txt
| LEAST(10,20,30) |
|----------------|
| 10             |
```

### Question 2
- Display current time in hour : min : sec format
```sql
SELECT to_char(sysdate, 'HH24:MI:SS') FROM dual;
```

**OUTPUT** 
```txt
03:20:33
```

