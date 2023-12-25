CREATE TRIGGER AccountHist
On Account
AFTER UPDATE
AS
BEGIN
	INSERT INTO AccountHistory (AffectedId, Action, Date, OldBalance, NewBalance)
	SELECT Deleted.AccNumber,'UPDATE', GETDATE(), Deleted.AccBalance,Inserted.AccBalance
	FROM Deleted, Inserted
END;