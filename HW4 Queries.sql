USE TavernsDatabase;
GO
/* HW 4 */
/* QUESTION 1 */
SELECT Name,RoleID,ID FROM Users WHERE RoleID in (
SELECT ID FROM Roles WHERE Name = 'Admin')

/* QUESTION 2 */
SELECT Users.Name, Taverns.Name, Taverns.NumberOfFloors, Taverns.LocationID, Taverns.OwnerID FROM Taverns
INNER JOIN TavernUsers on Taverns.ID = TavernUsers.TavernId 
INNER JOIN Users on Users.ID = TavernUsers.UserID 
AND Users.ID in (
SELECT ID FROM Users WHERE RoleID in (
SELECT ID FROM Roles WHERE Name = 'Admin'))

/* QUESTION 3 */
SELECT Users.Name, Class.Name, UserClassLevel.Level FROM TavernUsers 
INNER JOIN Users on TavernUsers.UserID = Users.ID
INNER JOIN UserClassLevel on Users.ID = UserClassLevel.UserID
INNER JOIN Class on UserClassLevel.ClassID = Class.ID
ORDER BY Users.Name ASC

/* QUESTION 4 */
SELECT TOP 10 Sales.Price, Services.Name FROM Sales
INNER JOIN TavernServiceSales on Sales.ID = TavernServiceSales.SalesID
INNER JOIN TavernServices on TavernServices.ID = TavernServiceSales.TavernServiceID
INNER JOIN Services on TavernServices.ServicesID = Services.ID
ORDER BY Sales.Price DESC

/* QUESTION 5 */
SELECT Users.ID, Users.Name
FROM Users
LEFT JOIN UserClassLevel ON Users.ID = UserClassLevel.UserID
GROUP BY Users.Name, Users.ID
HAVING COUNT(DISTINCT ClassID) >= 2
ORDER BY Users.Name ASC


/* QUESTION 6 */
SELECT Users.ID, Users.Name
FROM Users
LEFT JOIN UserClassLevel ON Users.ID = UserClassLevel.UserID
WHERE UserClassLevel.Level > 5
GROUP BY Users.Name, Users.ID
HAVING COUNT(DISTINCT ClassID) >= 2
ORDER BY Users.Name ASC

/* QUESTION 7 */
SELECT Users.ID, Users.Name, Max(UserClassLevel.Level) MaxLevel
FROM Users
LEFT JOIN UserClassLevel ON Users.ID = UserClassLevel.UserID
GROUP BY Users.Name, Users.ID
ORDER BY Users.ID ASC

/* QUESTION 8 */
SELECT DISTINCT Users.Name
FROM RoomStays 
LEFT JOIN TavernUsers on RoomStays.TavernUsersID = TavernUsers.ID
LEFT JOIN Users on TavernUsers.UserID = Users.ID
WHERE Date BETWEEN '2010-1-1' AND '2020-1-1'

/* QUESTION 9  I'm still kinda stuck here*/
SELECT 
	CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'Taverns'
UNION ALL
SELECT 
	CONCAT(
		cols.COLUMN_NAME, ' ', cols.DATA_TYPE, 
		(CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
		Then CONCAT('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), 
		')') 
		Else '' END), ','
	) as queryPiece 
FROM INFORMATION_SCHEMA.COLUMNS as cols 
	WHERE TABLE_NAME = 'Taverns'
UNION ALL
SELECT 
	CONCAT(
		cols.CONSTRAINT_TYPE, '(', cols2.COLUMN_NAME, ')',
		(CASE WHEN cols.CONSTRAINT_TYPE = 'FOREIGN KEY'
		Then CONCAT(' REFERENCES "',cols2.TABLE_NAME, '"(',
		')') 
		Else '' END)
	) as queryPiece 
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS as cols 
	LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS cols2 ON cols.CONSTRAINT_NAME = cols2.CONSTRAINT_NAME 
	FULL OUTER JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS cols3 ON cols2.CONSTRAINT_NAME = cols3.CONSTRAINT_NAME 
	WHERE cols.TABLE_NAME = 'Taverns'
UNION ALL
SELECT ')';





