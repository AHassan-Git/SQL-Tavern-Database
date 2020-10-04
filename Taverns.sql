/* TABLE CREATION */
USE TavernsDatabase;
DROP TABLE IF EXISTS "Status","TavernSupplies","TavernSupplyReceivedSales","TavernSuppliesReceived", "TavernServiceSales", "TavernServices","RoomStays","Sales", "TavernUsers", "TavernRooms","Taverns","Users", BasementRats, "Locations", "Supply", "Services", "UserStatus","ServiceStatus", "UserClassLevel", "Class", "Roles", "RoomStatus";



CREATE TABLE "RoomStatus"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Status" VARCHAR(2000) NOT NULL,
	PRIMARY KEY("ID")
);
CREATE TABLE "Roles"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Description" VARCHAR(255) NOT NULL
	PRIMARY KEY("ID")
);
CREATE TABLE "Class"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
	PRIMARY KEY("ID")
);
CREATE TABLE "UserClassLevel"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "ClassID" INT NOT NULL,
	"UserID" INT NOT NULL,
    "Level" INT NOT NULL
	PRIMARY KEY("ID")
	FOREIGN KEY("ClassID") REFERENCES "Class"("ID")
);
CREATE TABLE "ServiceStatus"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
	PRIMARY KEY("ID")
);
CREATE TABLE "UserStatus"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
	PRIMARY KEY("ID")
);
CREATE TABLE "Services"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
	PRIMARY KEY("ID")
);
CREATE TABLE "Supply"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "UnitOfMeasurement" VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
	PRIMARY KEY("ID")
);
CREATE TABLE "Locations"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
	PRIMARY KEY("ID")
);
CREATE TABLE "Users"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "RoleID" INT NOT NULL,
    "UserStatusID" INT,
    "UserClassLevelID" INT NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Birthdays" DATE,
    "Cakedays" DATE,
    "Notes" VARCHAR(255)
	PRIMARY KEY("ID")
	FOREIGN KEY("RoleID") REFERENCES "Roles"("ID"),
	FOREIGN KEY("UserStatusID") REFERENCES "UserStatus"("ID"),
	FOREIGN KEY("UserClassLevelID") REFERENCES "UserClassLevel"("ID")
);
CREATE TABLE "Taverns"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "LocationID" INT NOT NULL,
    "OwnerID" INT NOT NULL,
    "NumberOfFloors" INT NOT NULL
	PRIMARY KEY("id"),
	FOREIGN KEY("LocationID") REFERENCES "Locations"("ID")
);
CREATE TABLE "TavernRooms"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "TavernID" INT NOT NULL,
    "RoomStatusID" INT NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("TavernID") REFERENCES "Taverns"("ID"),
	FOREIGN KEY("RoomStatusID") REFERENCES "RoomStatus"("ID")
);
CREATE TABLE "TavernUsers"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "UserID" INT NOT NULL,
    "TavernID" INT NOT NULL,
	PRIMARY KEY("ID"),
	FOREIGN KEY("TavernID") REFERENCES "Taverns"("ID"),
	FOREIGN KEY("UserID") REFERENCES "Users"("ID")
);
CREATE TABLE "Sales"(
    "TavernUserID" INT NOT NULL,
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Price" INT NOT NULL,
    "Amount" INT NOT NULL,
    "Date" DATETIME,
	PRIMARY KEY("ID"),
	FOREIGN KEY("TavernUserID") REFERENCES "TavernUsers"("ID")
);
CREATE TABLE "RoomStays"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "TavernRoomID" INT NOT NULL,
    "SalesID" INT NOT NULL,
	"TavernUsersID" INT NOT NULL,
	"Date" DATE,
	"Rate" INT,
	PRIMARY KEY("id"),
	FOREIGN KEY("TavernRoomID") REFERENCES "TavernRooms"("ID"),
	FOREIGN KEY("SalesID") REFERENCES "Sales"("ID"),
	FOREIGN KEY("TavernUsersID") REFERENCES "TavernUsers"("ID")
);
CREATE TABLE "TavernServices"(
    "TavernID" INT NOT NULL,
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "ServicesID" INT NOT NULL,
    "ServiceStatusID" INT NOT NULL,
	PRIMARY KEY("ID"),
	FOREIGN KEY("ServicesID") REFERENCES "Services"("ID"),
	FOREIGN KEY("ServiceStatusID") REFERENCES "ServiceStatus"("ID"),
	FOREIGN KEY("TavernID") REFERENCES "Taverns"("ID")
);

CREATE TABLE "TavernServiceSales"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "SalesID" INT NOT NULL,
    "TavernServiceID" INT NOT NULL
	PRIMARY KEY("ID")
	FOREIGN KEY("SalesID") REFERENCES "Sales"("ID"),
	FOREIGN KEY("TavernServiceID") REFERENCES "TavernServices"("ID")
);

CREATE TABLE "TavernSuppliesReceived"(
    "TavernID" INT NOT NULL,
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "SupplyID" INT NOT NULL,
    "Cost" INT NOT NULL,
    "Amount" INT NOT NULL,
    "DateUpdated" DATETIME
	PRIMARY KEY("ID")
	FOREIGN KEY("TavernID") REFERENCES "Taverns"("ID"),
	FOREIGN KEY("SupplyID") REFERENCES "Supply"("ID")
);

CREATE TABLE "TavernSupplyReceivedSales"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "SalesID" INT NOT NULL,
    "TavernSupplyReceivedID" INT NOT NULL
	PRIMARY KEY("ID")
	FOREIGN KEY("SalesID") REFERENCES "Sales"("ID"),
	FOREIGN KEY("TavernSupplyReceivedID") REFERENCES "TavernSuppliesReceived"("ID")
);

CREATE TABLE "TavernSupplies"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "TavernID" INT NOT NULL,
    "SupplyID" INT NOT NULL,
    "Amount" INT NOT NULL,
    "Date" DATETIME
	PRIMARY KEY("ID")
	FOREIGN KEY("SupplyID") REFERENCES "Supply"("ID"),
	FOREIGN KEY("TavernID") REFERENCES "Taverns"("ID")
);






/* ALTERING FOREIGN KEYS
ALTER TABLE
    "Taverns" ADD CONSTRAINT "taverns_locationid_foreign" 
ALTER TABLE
    "TavernUsers" ADD CONSTRAINT "tavernusers_tavernid_foreign" ;
ALTER TABLE
    "TavernUsers" ADD CONSTRAINT "tavernusers_userid_foreign" ;
ALTER TABLE
    "Users" ADD CONSTRAINT "users_roleid_foreign" ;
ALTER TABLE
    "Users" ADD CONSTRAINT "users_userstatusid_foreign"  ;
ALTER TABLE
    "Users" ADD CONSTRAINT "users_userclasslevelid_foreign" ;
ALTER TABLE
    "UserClassLevel" ADD CONSTRAINT "userclasslevel_classid_foreign" ;
ALTER TABLE
    "TavernSuppliesReceived" ADD CONSTRAINT "tavernsuppliesreceived_tavernid_foreign" ;
ALTER TABLE
    "TavernSuppliesReceived" ADD CONSTRAINT "tavernsuppliesreceived_supplyid_foreign" ;
ALTER TABLE
    "TavernSupplies" ADD CONSTRAINT "tavernsupplies_supplyid_foreign" ;
ALTER TABLE
    "TavernSupplies" ADD CONSTRAINT "tavernsupplies_tavernid_foreign" ;
ALTER TABLE
    "TavernServiceSales" ADD CONSTRAINT "tavernservicesales_salesid_foreign" ;
ALTER TABLE
    "Sales" ADD CONSTRAINT "sales_tavernuserid_foreign"  ;
ALTER TABLE
    "TavernServices" ADD CONSTRAINT "tavernservices_servicesid_foreign" ;
ALTER TABLE
    "TavernServices" ADD CONSTRAINT "tavernservices_servicestatusid_foreign" ;
ALTER TABLE
    "TavernSupplyReceivedSales" ADD CONSTRAINT "tavernsupplyreceivedsales_salesid_foreign" ;
ALTER TABLE
    "TavernSupplyReceivedSales" ADD CONSTRAINT "tavernsupplyreceivedsales_tavernsupplyreceivedid_foreign" ;
ALTER TABLE
    "TavernServiceSales" ADD CONSTRAINT "tavernservicesales_tavernserviceid_foreign" ;
ALTER TABLE
    "TavernServices" ADD CONSTRAINT "tavernservices_tavernid_foreign" 


ALTER TABLE
    "TavernRooms" ADD CONSTRAINT "tavernrooms_tavernid_foreign" ;
ALTER TABLE
    "TavernRooms" ADD CONSTRAINT "tavernrooms_roomstatusid_foreign" ;
ALTER TABLE
    "RoomStays" ADD CONSTRAINT "roomstays_tavernroomid_foreign" ;
ALTER TABLE
    "RoomStays" ADD CONSTRAINT "roomstays_salesid_foreign" ;
ALTER TABLE
    "RoomStays" ADD CONSTRAINT "roomstays_tavernusersid_foreign" ;
	 */



   












































