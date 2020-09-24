
DROP TABLE IF EXISTS [Tavern, Location, Users, Roles, BasementRats, Inventory, SupplyItem, Received, Service, Status, Sales];


CREATE TABLE [Tavern] (
	ID INT IDENTITY(1, 1),
	Name varchar(250),
	LocationID INT,
	OwnerID INT,
	NumberOfFloors INT
);
INSERT INTO Taverns (Name,LocationID,OwnerID,NumberOfFloors)
VALUES ("Tavern1",1,1,3),("Tavern2",2,2,4),("Tavern3",3,3,3),("Tavern4",4,4,4),("Tavern5",5,5,3);

CREATE TABLE [Location] (
	ID INT IDENTITY(1, 1),
	Name varchar(250)
);
INSERT INTO Location (Name)
VALUES ("Prague"),("Rothenburg"),("Mont Saint Michel"),("Siena"),("Carcassone");


CREATE TABLE [Users] (
	ID INT IDENTITY(1, 1),
	Name varchar(250),
	RoleID INT,
);
INSERT INTO Users (Name, RoleID)
VALUES ("Matt", 1),("Rose" , 2),("Kevin", 3),("Matt", 4),("Joe", 5),("Rose" , 2);

CREATE TABLE [Roles] (
	ID TINYINT IDENTITY(1, 1),
	Name varchar(250),
	Description varchar(8000)
);
INSERT INTO Roles (Name, Description)
VALUES ("Miller", "I do Miller stuff"),("StoneMason" , "I do StoneMason stuff"),("BlackSmith", "I do BlackSmith stuff"),("Armorer", "I do Armorer stuff"),("Falconer", "I do Falconer stuff");("TavernOwner", "I do TavernOwnver stuff");


CREATE TABLE [BasementRats] (
	ID INT IDENTITY(1, 1),
	Name varchar(250)
);
INSERT INTO BasementRats (Name)
VALUES ("Remy"),("Templeton"),("Roddy"),("Remy"),("Roddy");



CREATE TABLE [Inventory] (
	ID INT IDENTITY(1, 1),
	TavernID INT,
	SupplyItemID INT,
	Amount INT,
	Date DATETIME  /*not sure if date will be automatically updated*/
);
INSERT INTO Inventory (TavernID,SupplyItemID,Amount)
VALUES (1,1,3),(2,2,4),(3,3,3),(4,4,4),(5,5,3);


CREATE TABLE [SupplyItem] (
	ID INT IDENTITY(1, 1),
	UnitOfMeasurement varchar(250),
	Name varchar(250)
);
INSERT INTO SupplyItem (UnitOfMeasurement, Name)
VALUES ("Pounds", "Bread"),("Pounds" , "Meat"),("Ounces", "strong ale"),("Ounces", "Rum"),("Ounces", "Frost Mead"),("Pounds", "Apples");


CREATE TABLE [Received] (
	ID INT IDENTITY(1, 1),
	TavernID INT,
	SupplyItemID INT,
	Cost INT,
	Amount INT,
	Date DATETIME
);
INSERT INTO Received (TavernID,SupplyItemID,Cost,Amount)
VALUES (1,1,5,3),(2,2,6,4),(3,3,5,3),(4,4,12,4),(5,5,9,3);


CREATE TABLE [Service] (
	ID INT IDENTITY(1, 1),
	StatusID INT,
	Name varchar(250)
);
INSERT INTO Service (Name, StatusID)
VALUES ("Pool", 1),("Weapon sharpening" , 2),("Boot shining", 2),("Poker table", 1),("Darts", 5);


CREATE TABLE [Status] (
	ID INT IDENTITY(1, 1),
	Name varchar(250),
);
INSERT INTO Status (Name)
VALUES ("Active"),("Inactive"),("Stock"),("Discontinued"),("Reserved");


CREATE TABLE [Sales] (
	ID INT IDENTITY(1, 1),
	TaverID INT,
	ServicesID INT,
	CustomerID INT,
	Price INT,
	Amount INT,
	Date DATETIME
);
INSERT INTO Sales (TavernID,ServicesID,CustomerID, Price, Amount)
VALUES (1,1,3,4,2),(2,2,4,12,3),(3,3,3,34,2),(4,4,4,12,6),(5,5,3,9,5);