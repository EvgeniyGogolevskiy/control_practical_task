CREATE VIEW SKUprice AS
SELECT ID, Code, Name, dbo.calculate_cost(ID) as Price
FROM dbo.SKU;