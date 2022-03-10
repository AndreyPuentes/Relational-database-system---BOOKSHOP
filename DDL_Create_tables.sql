--DDL_BookShop - Creación de tablas
DROP DATABASE IF EXISTS BookShop;
CREATE DATABASE BookShop;
USE BookShop;
DROP TABLE IF EXISTS Publisher;
CREATE TABLE Publisher(
PublisherID INT PRIMARY KEY,
Publishername VARCHAR(45),
PublisherPhone INT,
URL VARCHAR(45),
PublisherAddress VARCHAR(45)
);
DROP TABLE IF EXISTS Author;
CREATE TABLE Author(
AuthorID INT PRIMARY KEY,
Authorname VARCHAR(45),
AuthorAddress VARCHAR(45)
);
DROP TABLE IF EXISTS Book;
CREATE TABLE Book(
ISBN VARCHAR(20) PRIMARY KEY,
Year SMALLDATETIME,
Title VARCHAR(45),
Price FLOAT,
PublisherID INT FOREIGN KEY REFERENCES Publisher(PublisherID),
AuthorID INT FOREIGN KEY REFERENCES Author(AuthorID)
);
DROP TABLE IF EXISTS Warehouse;
CREATE TABLE Warehouse(
code INT PRIMARY KEY,
WarehousePhone VARCHAR(45),
WarehouseAddress VARCHAR(45)
);
DROP TABLE IF EXISTS Warehouse_have_books;
CREATE TABLE Warehouse_have_books(
Book_ISBN VARCHAR(20) FOREIGN KEY REFERENCES Book(ISBN),
Warehouse_code INT FOREIGN KEY REFERENCES Warehouse(code),
count int
);
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer(
CustomerEmail VARCHAR(45) PRIMARY KEY,
CustomerName VARCHAR(45),
CustomerPhone INT,
CustomerAddress VARCHAR(45)
);
DROP TABLE IF EXISTS ShoppingBasket;
CREATE TABLE ShoppingBasket(
ShoppingBasketID INT PRIMARY KEY,
CustomerEmail VARCHAR(45) FOREIGN KEY REFERENCES Customer(CustomerEmail)
);
DROP TABLE IF EXISTS ShoppingBasket_have_books;
CREATE TABLE ShoppingBasket_have_books(
Book_ISBN VARCHAR(20) FOREIGN KEY REFERENCES Book(ISBN),
ShoppingBasketID INT FOREIGN KEY REFERENCES ShoppingBasket(ShoppingBasketID),
count INT
);