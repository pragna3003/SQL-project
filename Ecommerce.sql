CREATE DATABASE ECOMMERCE;
-- User table for storing user details
CREATE TABLE UsersS (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

-- Product category table
CREATE TABLE ProductCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

-- Product table for storing product details
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES ProductCategories(CategoryID)
);

-- Customer table for storing customer details
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    UserID INT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    -- Add more customer-related fields as needed
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Cart table for storing items in the user's shopping cart
CREATE TABLE Cart (
    CartID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Order table for storing order details
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Add more order-related fields as needed
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderItem table for storing items in an order
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Users table
INSERT INTO Userss (UserID, Username, Password, Email)
VALUES
(1, 'john_doe', 'password123', 'john.doe@email.com'),
(2, 'jane_smith', 'securepass', 'jane.smith@email.com'),
(3, 'bob_jackson', 'userpass', 'bob.jackson@email.com'),
(4, 'alice_wonder', '1234pass', 'alice.wonder@email.com'),
(5, 'charlie_brown', 'pass1234', 'charlie.brown@email.com'),
(6, 'emily_davis', 'emilypass', 'emily.davis@email.com'),
(7, 'michael_jones', 'mikepass', 'michael.jones@email.com'),
(8, 'sara_martin', 'sara123', 'sara.martin@email.com'),
(9, 'david_andrews', 'davidpass', 'david.andrews@email.com'),
(10, 'olivia_smith', 'olivia123', 'olivia.smith@email.com');

-- ProductCategories table
INSERT INTO ProductCategories (CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home Appliances'),
(5, 'Beauty'),
(6, 'Toys'),
(7, 'Sports'),
(8, 'Furniture'),
(9, 'Jewelry'),
(10, 'Automotive');

-- Products table
INSERT INTO Products (ProductID, CategoryID, ProductName, Description, Price, StockQuantity)
VALUES
(1, 1, 'Laptop', 'High-performance laptop', 999.99, 50),
(2, 1, 'Smartphone', 'Latest smartphone model', 499.99, 100),
(3, 2, 'T-shirt', 'Cotton casual T-shirt', 19.99, 200),
(4, 2, 'Jeans', 'Slim-fit blue jeans', 39.99, 150),
(5, 3, 'Book - Fiction', 'Bestselling fiction novel', 14.99, 75),
(6, 3, 'Book - Non-Fiction', 'Educational non-fiction book', 24.99, 50),
(7, 4, 'Microwave Oven', '1000W countertop microwave', 129.99, 30),
(8, 5, 'Lipstick', 'Long-lasting red lipstick', 9.99, 100),
(9, 6, 'Toy Robot', 'Interactive robot toy', 29.99, 80),
(10, 7, 'Running Shoes', 'High-performance running shoes', 79.99, 120);

-- Customers table
INSERT INTO Customers (CustomerID, UserID, FirstName, LastName, Address)
VALUES
(1, 1, 'John', 'Doe', '123 Main St'),
(2, 2, 'Jane', 'Smith', '456 Oak Ave'),
(3, 3, 'Bob', 'Jackson', '789 Pine St'),
(4, 4, 'Alice', 'Wonder', '101 Maple Ave'),
(5, 5, 'Charlie', 'Brown', '202 Cedar St'),
(6, 6, 'Emily', 'Davis', '303 Elm St'),
(7, 7, 'Michael', 'Jones', '404 Birch Ave'),
(8, 8, 'Sara', 'Martin', '505 Spruce St'),
(9, 9, 'David', 'Andrews', '606 Willow Ave'),
(10, 10, 'Olivia', 'Smith', '707 Oak St');

-- Cart table
INSERT INTO Cart (CartID, CustomerID, ProductID, Quantity)
VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3),
(4, 3, 4, 1),
(5, 4, 5, 2),
(6, 5, 6, 1),
(7, 6, 7, 2),
(8, 7, 8, 1),
(9, 8, 9, 3),
(10, 9, 10, 1);

-- Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
(1, 1, '2024-01-14 10:00:00'),
(2, 2, '2024-01-15 12:30:00'),
(3, 3, '2024-01-16 14:45:00'),
(4, 4, '2024-01-17 16:30:00'),
(5, 5, '2024-01-18 18:20:00'),
(6, 6, '2024-01-19 20:15:00'),
(7, 7, '2024-01-20 22:10:00'),
(8, 8, '2024-01-21 08:45:00'),
(9, 9, '2024-01-22 09:30:00'),
(10, 10, '2024-01-23 11:20:00');

-- OrderItems table
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 1, 1, 999.99),
(2, 1, 2, 2, 499.99),
(3, 2, 3, 3, 59.97),
(4, 3, 4, 1, 39.99),
(5, 4, 5, 2, 29.98),
(6, 5, 6, 1, 24.99),
(7, 6, 7, 2, 259.98),
(8, 7, 8, 1, 9.99),
(9, 8, 9, 3, 89.97),
(10, 9, 10, 1, 79.99);
S
SELECT Products.ProductID, Products.ProductName, Products.Description, Products.Price, Products.StockQuantity, ProductCategories.CategoryName
FROM Products, ProductCategories
WHERE Products.CategoryID = ProductCategories.CategoryID;


SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Address
FROM Orders, Customers
WHERE Orders.CustomerID = Customers.CustomerID;
