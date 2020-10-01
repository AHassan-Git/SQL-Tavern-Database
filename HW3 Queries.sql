USE TavernsDatabase;
GO
/* HW 3 */
/* QUESTION 2 */

 SELECT* FROM USERS WHERE Birthdays < '2000-1-1'

 /* QUESTION 3 */
 SELECT id FROM TavernRooms WHERE ID in (SELECT TavernRoomID FROM RoomStays WHERE Rate > 100)

 /* QUESTION 4 */
 SELECT DISTINCT Name FROM Users 

  /* QUESTION 5 */
   SELECT Name FROM Users order by name asc
 
 /* QUESTION 6 */
 SELECT TOP(10) Price FROM Sales order by Price desc

  /* QUESTION 7 */  /*I'm currenlty stuck here*/
 SELECT * FROM RoomStatus
 UNION
 SELECT * FROM sys.all_columns
 select * from Users for xml auto

   /* QUESTION 8 */
  SELECT Name,Level, CASE WHEN Level <= 10 THEN 'lvl 1-10' WHEN Level <= 20 THEN 'lvl 11-20' WHEN Level <= 30 THEN 'lvl 21-30' END 
  FROM UserClassLevel INNER JOIN Class ON Class.ID = UserClassLevel.ClassID


 /* QUESTION 9 */
 INSERT INTO RoomStatus (Status)
SELECT Name FROM UserStatus;