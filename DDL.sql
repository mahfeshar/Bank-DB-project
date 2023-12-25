-- Create the database "bank"
create database Bank

-- Select the "bank" as the current working
use Bank

-- Create the Branch table
CREATE TABLE Branch(
BID INT PRIMARY KEY,
BName VARCHAR(50) NOT NULL,
BAddress VARCHAR(100));

-- Create the Employee table
CREATE TABLE Employee (
EID INT PRIMARY KEY,
EName VARCHAR(50),
EPosition VARCHAR(50) NOT NULL,
EDepartment VARCHAR(50),
EPhone VARCHAR(20) NOT NULL,
EEmail VARCHAR(50) NOT NULL,
BID INT FOREIGN KEY REFERENCES Branch(BID));

-- Create the Account table
CREATE TABLE Account (
AccNumber INT PRIMARY KEY,
AccType VARCHAR(20) CHECK (AccType IN ('Savings', 'Checking', 'Loan', 'Credit')),
AccBalance DECIMAL(15,2),
BID INT FOREIGN KEY REFERENCES Branch(BID),
CusID INT,
CusPhone VARCHAR(20) NOT NULL,
CusName VARCHAR(50) NOT NULL,
CusAddress VARCHAR(100) NOT NULL,
CusEmail VARCHAR(50));

-- Create the transaction table
CREATE TABLE Trans (
TID INT PRIMARY KEY,
Date DATE,
To_ID INT FOREIGN KEY REFERENCES Account(AccNumber),
Amount DECIMAL(15,2),
AccNumber INT FOREIGN KEY REFERENCES Account(AccNumber));

-- Create the AccountHistory table
CREATE TABLE AccountHistory (
HID INT PRIMARY KEY IDENTITY(1, 1),
AffectedID INT FOREIGN KEY REFERENCES Account(AccNumber),
Action VARCHAR(50),
Date DATE DEFAULT GETDATE(),
OldBalance DECIMAL(15,2),
NewBalance DECIMAL(15,2));

-- Create the Loan table
CREATE TABLE Loan (
LoanID INT PRIMARY KEY,
LType VARCHAR(20),
LAmount DECIMAL(15,2) CHECK (LAmount > 0),
BID INT FOREIGN KEY REFERENCES Branch(BID));

-- relation loans with customer accounts
CREATE TABLE LoanCustomer (
LoanID INT FOREIGN KEY REFERENCES Loan(LoanID),
AccID INT FOREIGN KEY REFERENCES Account(AccNumber),
PRIMARY KEY (LoanID, AccID));