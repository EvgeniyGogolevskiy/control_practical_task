CREATE TABLE dbo.SKU (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Code AS ('s' + CAST(ID AS VARCHAR(50))) PERSISTED UNIQUE, ---- не совсем понял что значит "s"+ID
    Name VARCHAR(50)
);

CREATE TABLE dbo.Family (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SurName VARCHAR(50),
    BudgetValue INT
);

CREATE TABLE dbo.Basket (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ID_SKU INT,
    ID_FAMILY INT,
    Quantity INT CHECK (Quantity >= 0),
    Value INT CHECK (Value >= 0),
    PurchaseDate DATETIME DEFAULT (getdate()),
    DiscountValue INT,
    FOREIGN KEY (ID_SKU) REFERENCES dbo.SKU(ID),
    FOREIGN KEY (ID_FAMILY) REFERENCES dbo.Family(ID)
);