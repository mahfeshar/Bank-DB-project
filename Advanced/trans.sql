DECLARE @FromAccNumber INT = 1002;
DECLARE @ToAccNumber INT = 1004;
DECLARE @TID INT = 7;
DECLARE @TransferAmount DECIMAL(15, 2) = 400.00;

BEGIN TRANSACTION;

UPDATE Account
SET AccBalance = AccBalance - @TransferAmount
WHERE AccNumber = @FromAccNumber;


UPDATE Account
SET AccBalance = AccBalance + @TransferAmount
WHERE AccNumber = @ToAccNumber;

INSERT INTO Trans (TID, Date, To_ID, Amount, AccNumber)
VALUES (@TID, GETDATE(), @ToAccNumber, @TransferAmount, @FromAccNumber);
COMMIT;