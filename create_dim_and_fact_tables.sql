
---create pc dim shop table
IF OBJECT_ID('[PC_DATA_DW].dbo.PC_Dim_Shop', 'U') IS NULL
BEGIN
    CREATE TABLE [PC_DATA_DW].dbo.PC_Dim_Shop (
        ShopKey int IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [Continent] [nvarchar](100) NULL,
        [Country_or_State] [nvarchar](100) NULL,
        [Province_or_City] [nvarchar](100) NULL,
        [Shop_Name] [nvarchar](100) NULL,
        [Shop_Age] [tinyint] NULL,
        LoadDate DATETIME DEFAULT GETDATE(),
        LastRunCheckDate DATETIME NULL
);
END

---create pc dim product table
IF OBJECT_ID('[PC_DATA_DW].dbo.PC_Dim_Product', 'U') IS NULL
BEGIN
    CREATE TABLE [PC_DATA_DW].dbo.PC_Dim_Product(
        ProductKey int IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [PC_Make] [nvarchar](100) NULL,
        [PC_Model] [nvarchar](100) NULL,
        [Storage_Type] [nvarchar](100) NULL,
        [PC_Market_Price] [bigint] NULL,
        [Storage_Capacity] [nvarchar](100) NULL,
        [RAM] [nvarchar](100) NULL,
        LoadDate DATETIME DEFAULT GETDATE(),
        LastRunCheckDate DATETIME NULL
);
END

---create pc dim customer table
IF OBJECT_ID('[PC_DATA_DW].dbo.PC_Dim_Customer', 'U') IS NULL
BEGIN
    CREATE TABLE [PC_DATA_DW].dbo.PC_Dim_Customer(
        CustomerKey int IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [Customer_Name] [nvarchar](100) NULL,
        [Customer_Surname] [nvarchar](100) NULL,
        [Customer_Contact_Number] [nvarchar](100) NULL,
        [Customer_Email_Address] [nvarchar](100) NULL,
        [Credit_Score] [int] NULL,
        LoadDate DATETIME DEFAULT GETDATE(),
        LastRunCheckDate DATETIME NULL
);
END

---create pc dim order table
IF OBJECT_ID('[PC_DATA_DW].dbo.PC_Dim_Order', 'U') IS NULL
BEGIN
    CREATE TABLE [PC_DATA_DW].dbo.PC_Dim_Order(
        OrderKey int IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [Purchase_Date] [DATETIME] NULL,
        [Ship_Date] [DATETIME] NULL,
        [Payment_Method] [nvarchar](100) NULL,
        [Priority] [nvarchar](100) NULL,
        [Channel] [nvarchar](100) NULL,
        LoadDate DATETIME DEFAULT GETDATE(),
        LastRunCheckDate DATETIME NULL
);
END

----create pc fact table
IF OBJECT_ID('[PC_DATA_DW].dbo.PC_Fact_Table', 'U') IS NULL
BEGIN
    CREATE TABLE [PC_DATA_DW].dbo.PC_Fact_Table(
        FactKey int IDENTITY(1,1) NOT NULL,
        ShopKey int NOT NULL,
        ProductKey int NOT NULL,
        CustomerKey  int NOT NULL,
        OrderKey int NOT NULL,
        [Cost_Price] decimal(18, 2) NULL,
        [Sale_Price] decimal(18, 2) NULL,
        [Discount_Amount] decimal(18, 2) NULL,
        [Finance_Amount] decimal(18, 2) NULL,
        [Cost_of_Repairs] decimal(18, 2) NULL,
        LoadDate DATETIME DEFAULT GETDATE(),
        LastRunCheckDate DATETIME NULL
);
END