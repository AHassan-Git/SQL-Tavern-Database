/* DATABASE SEEDING */
USE TavernsDatabase;
GO
INSERT INTO Roles (Name, Description)
VALUES ('Miller', 'I do Miller stuff'),('StoneMason' , 'I do StoneMason stuff'),('BlackSmith', 'I do BlackSmith stuff'),('Armorer', 'I do Armorer stuff'),('Falconer', 'I do Falconer stuff'),('TavernOwner', 'I do TavernOwnver stuff');

INSERT INTO Class (Name)
VALUES ('Fighter'),('Mage'),('Healer'),('Wizard'),('Archer'),('Hunter');

INSERT INTO UserClassLevel (ClassID, Level)
VALUES (1,6),(3,4),(2,4),(5,9),(4,2);

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

INSERT INTO Users (Name, RoleID)
VALUES ('Matt', 1),('Rose' , 2),('Kevin', 3),('Matt', 4),('Joe', 5),('Rose' , 2);


INSERT INTO Taverns (Name,LocationID,OwnerID,NumberOfFloors)
VALUES ('Tavern1',1,1,3),('Tavern2',2,2,4),('Tavern3',3,3,3),('Tavern4',4,4,4),('Tavern5',5,5,3);

INSERT INTO TavernUsers (UserID, TavernID)
VALUES (1,4),(2,1),(3,2),(4,3),(5,5);

INSERT INTO Sales (TavernUserID, Price, Amount)
VALUES (1,4,2),(2,12,3),(3,34,2),(4,12,6),(5,9,5);

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






















