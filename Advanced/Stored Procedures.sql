use Bank

-- making a procedure for Select the amount of Loan
CREATE PROCEDURE spGetLoan
@input_id int,
@amount DECIMAL(15,2) OUTPUT
AS
BEGIN
	SET nocount on;
	SELECT @amount = LAmount
	from Loan
	WHERE LoanID = @input_id
END

-- Using the procedure
DECLARE @result DECIMAL(15,2)
EXEC spGetLoan @input_id = 2, @amount = @result OUTPUT
SELECT @result AS Result

-- making a procedure for Insert new tuples at Loan
CREATE PROCEDURE spInsertLoan
@LID INT,
@type VARCHAR(20),
@amount DECIMAL(15,2),
@bankID INT
AS
BEGIN
BEGIN TRY
	INSERT INTO Loan VALUES
	(@LID, @type, @amount, @bankID)
	RETURN 0
END TRY
BEGIN CATCH
	RETURN -1
END CATCH
END

-- using the procedure
DECLARE @status INT
EXEC @status = spInsertLoan 3, 'Lap Loan', 500.00, 3
SELECT @status

SELECT * FROM Loan

DELETE FROM Loan WHERE LoanID = 3