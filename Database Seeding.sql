/* DATABASE SEEDING */
USE TavernsDatabase;
GO
INSERT INTO RoomStatus (Status)
VALUES ('Empty'),('Full'),('Reserved'),('Out Of Order'),('Under Construction');
INSERT INTO Roles (Name, Description)
VALUES ('Miller', 'I do Miller stuff'),('StoneMason' , 'I do StoneMason stuff'),('BlackSmith', 'I do BlackSmith stuff'),('Armorer', 'I do Armorer stuff'),('Falconer', 'I do Falconer stuff'),('TavernOwner', 'I do TavernOwnver stuff');

INSERT INTO Class (Name)
VALUES ('Fighter'),('Mage'),('Healer'),('Wizard'),('Archer'),('Hunter');

INSERT INTO UserClassLevel (ClassID, Level)
VALUES (1,15),(3,26),(2,12),(5,11),(4,25);

INSERT INTO ServiceStatus (Name)
VALUES ('Active'),('Inactive'),('Stock'),('Discontinued'),('Reserved');

INSERT INTO UserStatus (Name)
VALUES ('Awake'),('Asleep'),('Angry'),('Happy'),('Sad'),('Hungry');

INSERT INTO Services (Name)
VALUES ('Pool'),('Weapon sharpening'),('Boot shining'),('Poker table'),('Darts');

INSERT INTO Supply (UnitOfMeasurement, Name)
VALUES ('Pounds', 'Bread'),('Pounds' , 'Meat'),('Ounces', 'strong ale'),('Ounces', 'Rum'),('Ounces', 'Frost Mead'),('Pounds', 'Apples');

INSERT INTO Locations (Name)
VALUES ('Prague'),('Rothenburg'),('Mont Saint Michel'),('Siena'),('Carcassone');

INSERT INTO Users (Name, RoleID,UserClassLevelID,UserStatusID,Birthdays)
VALUES ('Matt', 1,1,2, '1950-11-11'),('Rose' , 2,2,2,'1908-11-11'),('Rose', 3,3,3, '1999-11-11'),('Matt', 4,4,4,'2008-11-11'),('Joe', 5,5,5,'2015-11-11');


INSERT INTO Taverns (Name,LocationID,OwnerID,NumberOfFloors)
VALUES ('Tavern1',1,1,3),('Tavern2',2,2,4),('Tavern3',3,3,3),('Tavern4',4,4,4),('Tavern5',5,5,3);

INSERT INTO TavernRooms (TavernID,RoomStatusID)
VALUES (1,1),(2,2),(3,3),(4,4),(5,5);

INSERT INTO TavernUsers (UserID, TavernID)
VALUES (1,4),(2,1),(3,2),(4,3),(5,5);

INSERT INTO Sales (TavernUserID, Price, Amount)
VALUES (1,4,2),(2,12,3),(3,34,2),(4,12,6),(5,9,5);

INSERT INTO RoomStays (TavernRoomID,SalesID,TavernUsersID, Rate)
VALUES (1,1,3,600),(2,2,4,700),(3,3,3,30),(4,4,4,60),(5,5,3,1000);

INSERT INTO TavernServices (TavernID,ServicesID, ServiceStatusID)
VALUES (1,1, 1),(2,2 , 2),(3,3, 2),(4,4, 1),(5,5, 5);

INSERT INTO TavernServiceSales (SalesID, TavernServiceID)
VALUES (1,4),(2,1),(3,2),(4,3),(5,5);

INSERT INTO TavernSuppliesReceived (TavernID,SupplyID,Cost,Amount)
VALUES (1,1,3,3),(2,2,4,64),(3,3,3,15),(4,4,4,9),(5,5,3,9);

INSERT INTO TavernSupplyReceivedSales (SalesID, TavernSupplyReceivedID)
VALUES (1,4),(2,1),(3,2),(4,3),(5,5);

INSERT INTO TavernSupplies (TavernID,SupplyID,Amount)
VALUES (1,1,3),(2,2,4),(3,3,3),(4,4,4),(5,5,3);




/* Testing Constraints */
/*
INSERT INTO Taverns (Name,LocationID,OwnerID,NumberOfFloors)
VALUES ('Tavern1',6,1,3);

INSERT INTO TavernSupplies (TavernID,SupplyID,Amount)
VALUES (1,22,3);
*/

















