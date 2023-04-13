CREATE TRIGGER Basket_insert_update ON dbo.Basket
AFTER INSERT AS
IF
    EXISTS
        (SELECT ID_SKU FROM inserted
        GROUP BY ID_SKU
        HAVING COUNT(ID_SKU) >=2)
    UPDATE dbo.Basket SET dbo.Basket.DiscountValue = dbo.Basket.[Value] * 0.05 FROM dbo.Basket INNER JOIN inserted
    ON dbo.Basket.ID_SKU = inserted.ID_SKU
    WHERE dbo.Basket.ID_SKU = inserted.ID_SKU
ELSE
    UPDATE dbo.Basket SET dbo.Basket.DiscountValue = 0 FROM dbo.Basket INNER JOIN inserted
    ON dbo.Basket.ID_SKU = inserted.ID_SKU
    WHERE dbo.Basket.ID_SKU = inserted.ID_SKU;