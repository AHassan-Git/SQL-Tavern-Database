USE TavernsDatabase;
GO

/* Table-Value */

IF OBJECT_ID (N'dbo.CreateTable', N'IF') IS NOT NULL  
    DROP FUNCTION dbo.CreateTable;  
GO  
CREATE FUNCTION dbo.CreateTable (@storeid int)  
RETURNS TABLE  
AS  
RETURN   
(  
		SELECT 
		CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
		FROM INFORMATION_SCHEMA.TABLES
		 WHERE TABLE_NAME = 'Taverns'
		UNION ALL
		SELECT CONCAT(cols.COLUMN_NAME, ' ', cols.DATA_TYPE, 
		(CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
		Then CONCAT('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), 
		')') Else '' END), ',') as queryPiece FROM 
		INFORMATION_SCHEMA.COLUMNS as cols WHERE
		TABLE_NAME = 'Taverns'
		UNION ALL
		SELECT ')'
);  
GO

/* Call Table-Value */
SELECT * FROM dbo.CreateTable (10); 




/* Scalar */
IF OBJECT_ID (N'dbo.getTotalPayment', N'FN') IS NOT NULL  
    DROP FUNCTION getTotalPayment;  
GO  
CREATE FUNCTION dbo.getTotalPayment(@SalesID int)  
RETURNS int
AS   
BEGIN  
    DECLARE @ret int;  
    SELECT @ret = (s.price * s.amount)   
    FROM Sales as s    
    WHERE s.ID = @SalesID ;
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END; 

GO


/* Calling Scalar 2*/
SELECT *, dbo.getTotalPayment(ID) AS 
TotalyPayment  
FROM Sales  


/* Scalar 2*/
IF OBJECT_ID (N'dbo.getSupplyPayment', N'FN') IS NOT NULL  
    DROP FUNCTION getSupplyPayment;  
GO  
CREATE FUNCTION dbo.getSupplyPayment(@ProductID int, @Amount int)  
RETURNS int
AS   
BEGIN  
    DECLARE @ret int;  
    SELECT @ret = (tsr.cost * @Amount)   
    FROM TavernSuppliesReceived as tsr    
    WHERE tsr.ID = @ProductID ;
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END; 

GO


/* Calling Scalar */
SELECT *, dbo.getSupplyPayment(ID, 4) AS 
TotalyPayment  
FROM TavernSuppliesReceived

select @@version