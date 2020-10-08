USE TavernsDatabase;
GO

/* Question 1 */
SELECT Users.ID AS UserID, Users.Name, Roles.Name FROM Users
LEFT JOIN Roles on Roles.ID = Users.RoleID

/* Question 2 */
SELECT Class.Name, COUNT(Users.ID) FROM Class
LEFT JOIN UserClassLevel on UserClassLevel.ClassID = Class.ID
LEFT JOIN Users on UserClassLevel.UserID = Users.ID
Group by Class.Name

/* Question 3 */
SELECT 
	Users.Name, 
	Class.Name,
	UserClassLevel.Level,
	CASE 
		WHEN UserClassLevel.Level <= 5 THEN 'beginner'
		WHEN UserClassLevel.Level <= 10 AND UserClassLevel.Level > 5 THEN 'intermediate'
		WHEN UserClassLevel.Level > 10 THEN 'expert'
		END
FROM Class
LEFT JOIN UserClassLevel on UserClassLevel.ClassID = Class.ID
LEFT JOIN Users on UserClassLevel.UserID = Users.ID
ORDER BY Users.Name ASC

/* Question 4 */
IF OBJECT_ID (N'dbo.getGrouping', N'FN') IS NOT NULL  
    DROP FUNCTION getGrouping;  
GO  
CREATE FUNCTION dbo.getGrouping(@LevelID int)  
RETURNS varchar(250)
AS   
BEGIN  
	DECLARE @ret varchar(250);  
	IF (@LevelID <= 5) SET  @ret = 'beginner';
	IF (@LevelID <= 10 AND @LevelID > 5)  SET @ret = 'intermediate';
	IF (@LevelID > 10) SET @ret = 'expert';
	ELSE SET @ret = '';
	RETURN @ret;
END; 

GO

/* Calling Function Q4*/
SELECT *, dbo.getGrouping(UserClassLevel.Level) FROM UserClassLevel  
GO

/* Question 5 */
IF OBJECT_ID (N'dbo.OpenRoomReport', N'IF') IS NOT NULL  
    DROP FUNCTION dbo.OpenRoomReport;  
GO  
CREATE FUNCTION dbo.OpenRoomReport (@date DATE)
RETURNS TABLE  
AS  
RETURN   
(  
	SELECT TavernRooms.ID as TavernRoom, Taverns.ID as TavernID, Taverns.Name TavernNane, RoomStatus.Status as RoomStatus FROM TavernRooms
	LEFT JOIN Taverns ON Taverns.ID = TavernRooms.TavernID
	LEFT JOIN RoomStatus ON RoomStatus.ID = TavernRooms.RoomStatusID
	WHERE RoomStatus.Status = 'Empty' AND RoomStatus.Date = @date
);  
GO

/* Call Table-Value */
SELECT * FROM dbo.OpenRoomReport ('2000-11-20'); 

/* Question 6 */
IF OBJECT_ID (N'dbo.PriceReport', N'IF') IS NOT NULL  
    DROP FUNCTION dbo.PriceReport;  
GO  
CREATE FUNCTION dbo.PriceReport (@MinPrice int, @MaxPrice int)
RETURNS TABLE  
AS  
RETURN   
(  
	SELECT TavernRooms.ID as RoomID, Taverns.ID as TavernID, Taverns.Name as TavernName, RoomStays.Rate as RoomRate FROM TavernRooms
	LEFT JOIN Taverns ON Taverns.ID = TavernRooms.TavernID
	LEFT JOIN RoomStays ON RoomStays.TavernRoomID = TavernRooms.ID
	WHERE RoomStays.Rate >= @MinPrice AND RoomStays.Rate <= @MaxPrice
);  
GO

/* Call Table-Value */
SELECT * FROM dbo.PriceReport (500, 900); 

/* Question 7 I"m currently stuck here*/
SELECT * FROM dbo.PriceReport (0,10); 

INSERT INTO TavernRooms (TavernID,RoomStatusID)
VALUES (1,1)

INSERT INTO RoomStays (TavernRoomID,SalesID,TavernUsersID, Rate,date)
VALUES (1,8,3,600,'2000-11-20')
