DECLARE @debt bit = 1;

	IF (@debt = 1)
		SELECT  *
		FROM     Account
		WHERE    AccBalance < 0
	ELSE
		SELECT  *
		FROM     Account
		WHERE    AccBalance >= 0 ;


-- To insert new data at Account table
DECLARE @count int = 0;
DECLARE @end int ;
SELECT @end = COUNT(CusID) 
FROM Account;

WHILE (@count < @end)
	BEGIN
		SET @count = @count+1
		INSERT INTO Account(CusEmail) 
		VALUES (CONCAT('customer', @count , '@gmail.com') )
	END
GO


CREATE FUNCTION getBalance (@CusID int)
RETURNS DECIMAL(15,2)
	BEGIN
		DECLARE @balance DECIMAL(15,2)
		SELECT @balance = AccBalance
		FROM Account 
		WHERE CusID = @CusID
		RETURN @balance
	END
GO

CREATE FUNCTION bigTrans()
RETURNS TABLE
	AS
	RETURN
	(
		SELECT TID, Amount
		FROM Trans
		WHERE Amount > 50
	);

Go
SELECT * FROM dbo.bigTrans()

SELECT dbo.getBalance(104) AS CustomerBalance;