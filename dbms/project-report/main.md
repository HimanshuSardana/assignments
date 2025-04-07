# DBMS
### By Himanshu Sardana

## Tables
**Customers**
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);
```

```sql
INSERT INTO Customers VALUES (1, 'Amanpreet Kaur', '9876543210', 'amanpreet@example.com');
INSERT INTO Customers VALUES (2, 'Rajinder Singh', '9123456789', 'rajinder@example.com');
```

**Payment**
```sql
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

```sql
INSERT INTO Payment VALUES (101, 1, 499.00, 'UPI');
INSERT INTO Payment VALUES (102, 2, 999.50, 'Debit Card');
```

**Orders**
```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    OrderStatus VARCHAR(50),
    PaymentStatus VARCHAR(50),
    HouseNo VARCHAR(20),
    StreetName VARCHAR(100),
    City VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

```sql
INSERT INTO Orders VALUES (1001, 1, '2025-04-01', 499.00, 'Processing', 'Paid', '221', 'Model Town', 'Patiala');
INSERT INTO Orders VALUES (1002, 2, '2025-04-02', 999.50, 'Delivered', 'Paid', '18', 'Leela Bhawan', 'Patiala');
```

**Recipient**
```sql
CREATE TABLE Recipient (
    OrderID INT PRIMARY KEY,
    RecipientName VARCHAR(100),
    Address TEXT,
    PhoneNumber VARCHAR(15),
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
```

```sql
INSERT INTO Recipient VALUES (1001, 'Harleen Kaur', 'House No. 221, Model Town, Patiala', '9811112233', 'Paid');
INSERT INTO Recipient VALUES (1002, 'Gurpreet Singh', 'House No. 18, Leela Bhawan, Patiala', '9878877654', 'Paid');
```

**Riders**
```sql
CREATE TABLE Riders (
    RiderID INT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(15),
    RecipientAddress TEXT,
    RecipientPhoneNumber VARCHAR(15),
    Location VARCHAR(100),
    PaymentStatus VARCHAR(50),
    Availability VARCHAR(50)
);
```

```sql
INSERT INTO Riders VALUES (201, 'Sukhwinder Singh', '9911112233', '221 Model Town, Patiala', '9811112233', 'Urban Estate Phase 2', 'Paid', 'Available');
INSERT INTO Riders VALUES (202, 'Mehak Sharma', '9988776655', '18 Leela Bhawan, Patiala', '9878877654', 'Tripuri Town', 'Paid', 'Busy');
```

**OrderRiders**
```sql
CREATE TABLE OrderRiders (
    OrderID INT,
    RiderID INT,
    PRIMARY KEY (OrderID, RiderID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID)
);
```

```sql
INSERT INTO OrderRiders VALUES (1001, 201);
INSERT INTO OrderRiders VALUES (1002, 202);
```

**Products**
```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);
```

```sql
INSERT INTO Products VALUES (301, 'Amul Butter 500g', 'Dairy', 220.00, 60);
INSERT INTO Products VALUES (302, 'Basmati Rice 5kg', 'Grocery', 780.00, 40);
```

**OrderProducts**
```sql
CREATE TABLE OrderProducts (
    OrderID INT,
    ProductID INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
```

```sql
INSERT INTO OrderProducts VALUES (1001, 301);
INSERT INTO OrderProducts VALUES (1002, 302);
```

**Dark Stores**
```sql
CREATE TABLE DarkStores (
    DarkStoreID INT PRIMARY KEY,
    PhoneNumber VARCHAR(15),
    Location VARCHAR(100)
);
```

```sql
INSERT INTO DarkStores VALUES (401, '01752221111', 'Rajpura Road, Patiala');
INSERT INTO DarkStores VALUES (402, '01752223333', 'Sirhind Road, Patiala');
```

**ProductSuppliers**
```sql
CREATE TABLE ProductSuppliers (
    ProductID INT,
    DarkStoreID INT,
    ItemQty INT,
    TotalAmount DECIMAL(10, 2),
    PRIMARY KEY (ProductID, DarkStoreID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (DarkStoreID) REFERENCES DarkStores(DarkStoreID)
);
```

```sql
INSERT INTO ProductSuppliers VALUES (301, 401, 30, 6600.00);
INSERT INTO ProductSuppliers VALUES (302, 402, 20, 15600.00);
```

