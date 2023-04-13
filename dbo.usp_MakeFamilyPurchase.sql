CREATE PROCEDURE Purchase @SurName VARCHAR(50) AS
IF EXISTS(SELECT * FROM Family WHERE SurName = @SurName)
    BEGIN
    UPDATE dbo.Family
    SET dbo.Family.BudgetValue = dbo.Family.BudgetValue - (SELECT SUM(dbo.Basket.[Value]) FROM dbo.Basket INNER JOIN dbo.Family
    ON dbo.Basket.ID_Family = dbo.Family.ID
    GROUP BY Surname
    HAVING dbo.Family.Surname = 'Petrov')
    END
ELSE
    PRINT 'There is no such Family';