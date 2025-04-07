```sql
-- CUSTOMERS TABLE
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    PhoneNumber VARCHAR2(15),
    Email VARCHAR2(100)
);

INSERT INTO Customers VALUES (1, 'Amanpreet Kaur', '9876543210', 'amanpreet@example.com');
INSERT INTO Customers VALUES (2, 'Rajinder Singh', '9123456789', 'rajinder@example.com');

-- PAYMENT TABLE
CREATE TABLE Payment (
    PaymentID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    Amount NUMBER(10, 2),
    PaymentMethod VARCHAR2(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Payment VALUES (101, 1, 499.00, 'UPI');
INSERT INTO Payment VALUES (102, 2, 999.50, 'Debit Card');

-- ORDERS TABLE
CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    OrderDate DATE,
    TotalAmount NUMBER(10, 2),
    OrderStatus VARCHAR2(50),
    PaymentStatus VARCHAR2(50),
    HouseNo VARCHAR2(20),
    StreetName VARCHAR2(100),
    City VARCHAR2(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES (1001, 1, TO_DATE('2025-04-01', 'YYYY-MM-DD'), 499.00, 'Processing', 'Paid', '221', 'Model Town', 'Patiala');
INSERT INTO Orders VALUES (1002, 2, TO_DATE('2025-04-02', 'YYYY-MM-DD'), 999.50, 'Delivered', 'Paid', '18', 'Leela Bhawan', 'Patiala');

-- RECIPIENT TABLE
CREATE TABLE Recipient (
    OrderID NUMBER PRIMARY KEY,
    RecipientName VARCHAR2(100),
    Address CLOB,
    PhoneNumber VARCHAR2(15),
    PaymentStatus VARCHAR2(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Recipient VALUES (1001, 'Harleen Kaur', 'House No. 221, Model Town, Patiala', '9811112233', 'Paid');
INSERT INTO Recipient VALUES (1002, 'Gurpreet Singh', 'House No. 18, Leela Bhawan, Patiala', '9878877654', 'Paid');

-- RIDERS TABLE
CREATE TABLE Riders (
    RiderID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    PhoneNumber VARCHAR2(15),
    RecipientAddress CLOB,
    RecipientPhoneNumber VARCHAR2(15),
    Location VARCHAR2(100),
    PaymentStatus VARCHAR2(50),
    Availability VARCHAR2(50)
);

INSERT INTO Riders VALUES (201, 'Sukhwinder Singh', '9911112233', '221 Model Town, Patiala', '9811112233', 'Urban Estate Phase 2', 'Paid', 'Available');
INSERT INTO Riders VALUES (202, 'Mehak Sharma', '9988776655', '18 Leela Bhawan, Patiala', '9878877654', 'Tripuri Town', 'Paid', 'Busy');

-- PRODUCTS TABLE (Needed before OrderProducts & ProductSuppliers)
CREATE TABLE Products (
    ProductID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Category VARCHAR2(50),
    Price NUMBER(10, 2),
    Stock NUMBER
);

INSERT INTO Products VALUES (301, 'Basmati Rice', 'Groceries', 220.00, 50);
INSERT INTO Products VALUES (302, 'Mustard Oil', 'Groceries', 780.00, 30);

-- ORDERPRODUCTS TABLE
CREATE TABLE OrderProducts (
    OrderID NUMBER,
    ProductID NUMBER,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderProducts VALUES (1001, 301);
INSERT INTO OrderProducts VALUES (1002, 302);

-- DARKSTORES TABLE
CREATE TABLE DarkStores (
    DarkStoreID NUMBER PRIMARY KEY,
    PhoneNumber VARCHAR2(15),
    Location VARCHAR2(100)
);

INSERT INTO DarkStores VALUES (401, '01752221111', 'Rajpura Road, Patiala');
INSERT INTO DarkStores VALUES (402, '01752223333', 'Sirhind Road, Patiala');

-- PRODUCTSUPPLIERS TABLE
CREATE TABLE ProductSuppliers (
    ProductID NUMBER,
    DarkStoreID NUMBER,
    ItemQty NUMBER,
    TotalAmount NUMBER(10, 2),
    PRIMARY KEY (ProductID, DarkStoreID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (DarkStoreID) REFERENCES DarkStores(DarkStoreID)
);

INSERT INTO ProductSuppliers VALUES (301, 401, 30, 6600.00);
INSERT INTO ProductSuppliers VALUES (302, 402, 20, 15600.00);

-- ORDERRIDERS TABLE
CREATE TABLE OrderRiders (
    OrderID NUMBER,
    RiderID NUMBER,
    PRIMARY KEY (OrderID, RiderID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID)
);

INSERT INTO OrderRiders VALUES (1001, 201);
INSERT INTO OrderRiders VALUES (1002, 202);
```
