/*creating the database named "productdb" to use when answering the questions*/
CREATE DATABASE IF NOT EXISTS ProductDB;
USE ProductDB;
CREATE TABLE ProductDetailRaw (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

/*Inserting sample data*/
INSERT INTO ProductDetailRaw (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'John Doe', 'Laptop', 2),
(101, 'John Doe', 'Mouse', 1),
(102, 'Jane Smith', 'Tablet', 3),
(102, 'Jane Smith', 'Keyboard', 1),
(102, 'Jane Smith', 'Mouse', 2),
(103, 'Emily Clark', 'Phone', 1);


/*ASSIGNMENT QUESTIONS*/
/*QUESTION 1 Achieving 1NF (First Normal Form) 🛠️*/
use productDB;
/*First Normal Form*/
SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
UNION ALL
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
SELECT 102, 'Jane Smith', 'Tablet'
UNION ALL
SELECT 102, 'Jane Smith', 'Keyboard'
UNION ALL
SELECT 102, 'Jane Smith', 'Mouse'
UNION ALL
SELECT 103, 'Emily Clark', 'Phone';


/*QUESTION 2 Achieving 2NF (Second Normal Form) 🧩*/

/*Table 1: Orders (removes partial dependency)*/
use productdb;
CREATE TABLE Orders AS
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

 /* normalized order details*/
use productdb;
CREATE TABLE OrderDetails2NF AS
SELECT OrderID, Product, Quantity
FROM OrderDetails;
