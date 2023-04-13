CREATE FUNCTION calculate_cost(@ID_SKU INT) RETURNS DECIMAL(18, 2)
    BEGIN
        DECLARE @sumValue DECIMAL(18,2), @sumQuantity DECIMAL(18,2), @Cost DECIMAL(18, 2)
        SELECT @sumValue = SUM (Value), @sumQuantity = SUM (Quantity) FROM dbo.Basket INNER JOIN dbo.SKU
        ON dbo.Basket.ID_SKU = dbo.SKU.ID
        WHERE @ID_SKU = dbo.Basket.ID_SKU;
        SET @Cost = @sumValue / @sumQuantity
        RETURN @Cost
    END;