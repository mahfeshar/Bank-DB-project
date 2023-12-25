-- Insert data into Branch table
INSERT INTO Branch (BID, BName, BAddress) VALUES
(1, 'Main Branch', '123 Main Street'),
(2, 'North Branch', '456 Tanta'),
(3, 'West Branch', '789 El Hyatem');

-- Insert data into Employee table
INSERT INTO Employee (EID, EName, EPosition, EDepartment, EPhone, EEmail, BID)VALUES 
(1, 'Mazen Sokar', 'Manager', 'Finance', '123-456-7890', 'mazen@bank.com', 1),
(2, 'Mostafa Bebany', 'Teller', 'Customer Service', '987-654-3210', 'bebo@bank.com', 2),
(3, 'Mohamed Elgazar', 'Manager', 'Customer Service', '957-604-3210', 'gazar@bank.com', 3),
(4, 'Mahmoud Feshar', 'Developer', 'Tech', '543-654-3210', 'corn@bank.com', 2),
(5, 'Sokar', 'Manager', 'Finance', '123-456-7890', 'sokar@bank.com', 1),
(6, 'Bebany', 'Teller', 'Customer Service', '987-654-3210', 'mezo@bank.com', 2),
(7, 'Elgazar', 'Manager', 'Customer Service', '957-604-3210', 'elgaz@bank.com', 3),
(8, 'Feshar', 'Developer', 'Tech', '543-654-3210', 'popcorn@bank.com', 2);


INSERT INTO Employee (EID, EName, EPosition, EDepartment, EPhone, EEmail, BID)VALUES 
(9, 'Dido', 'CEO', 'Testing', '123-456-7890', 'dido@bank.com', 1)
-- Insert data into Account table
INSERT INTO Account ( AccType, AccBalance, BID, CusPhone, CusName, CusAddress) VALUES 
('Credit', -1500.00, 1, '555-1212', 'Mazen Sokar', '123 elhlw'),
('Savings', 5000.00, 2, '555-2323', 'Mostafa Bebany', '456 elnshw'),
('Credit', -3500.00, 3, '555-1212', 'Alice', '2154 elhlw'),
('Savings', 2000.00, 2, '555-2323', 'Sokar', '6546 elnshw'),
('Credit', 1500.00, 3, '555-1212', 'Johnson', '254 elhlw')

-- Insert data into transaction table
INSERT INTO Trans (TID, Date, To_ID, Amount, AccNumber) VALUES
(1, '2023-12-23', 2, 50.00, 1),
(2, '2023-12-22', 1, 100.00, 2),
(3, '2023-12-22', 5, 100.00, 3),
(4, '2023-12-22', 1, 100.00, 1),
(5, '2023-12-22', 3, 100.00, 1),
(6, '2023-12-22', 2, 100.00, 5);

-- Insert dummy data into Loan table
INSERT INTO Loan (LoanID, LType, LAmount, BID)
VALUES 
(1, 'Personal Loan', 5000.00, 1),
(2, 'Car Loan', 20000.00, 2);

-- Insert dummy data into Loan_Customer table (ensuring referential integrity)
INSERT INTO LoanCustomer (LoanID, AccID)
VALUES 
(1, 1),
(2, 2);

-- Insert data into cusEmail and CusID
DECLARE @count int = 0;
DECLARE @end int ;
SELECT @end = COUNT(*) FROM Account;

WHILE (@count < @end)
BEGIN
    SET @count = @count + 1;

    UPDATE Account
    SET CusEmail = CONCAT('customer', @count, '@email.com')
    WHERE AccNumber = @count;
END
