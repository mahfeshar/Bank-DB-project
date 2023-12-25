SELECT AVG(Amount)
FROM Trans AS T
WHERE T.To_ID = '1001'

SELECT AccNumber
FROM Account
WHERE AccBalance = (SELECT MAX(AccBalance)
FROM Account);

SELECT COUNT(BID)
FROM Branch

SELECT T.TO_ID, MAX(T.Amount) AS Amount
FROM Trans AS T
WHERE Date = '2023-12-22'
GROUP BY T.To_ID
HAVING COUNT(*) = 1 ;

SELECT *
FROM Account AS A LEFT OUTER JOIN LoanCustomer AS L
ON A.AccNumber = L.AccID

SELECT A.AccNumber, A.AccType, A.BID,
  CASE
    WHEN A.AccBalance >= 0 THEN 'no debt'
    ELSE 'has debt'
  END AS status
FROM Account AS A;

CREATE VIEW finInfo AS
SELECT A.*
FROM Account AS A JOIN Employee AS E ON A.BID = E.BID
WHERE E.EDepartment = 'Finance';

SELECT * FROM finInfo
