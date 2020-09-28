/* TABLE CREATION */
USE TavernsDatabase;
DROP TABLE IF EXISTS "Status","TavernSupplies","TavernSupplyReceivedSales","TavernSuppliesReceived", "TavernServiceSales", "TavernServices", "Sales", "TavernUsers", "Taverns", "Users", BasementRats, "Locations", "Supply", "Services", "UserStatus","ServiceStatus", "UserClassLevel", "Class", "Roles";
CREATE TABLE "Taverns"(
    "id" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "LocationID" INT NOT NULL,
    "OwnerID" INT NOT NULL,
    "NumberOfFloors" INT NOT NULL
);
ALTER TABLE
    "Taverns" ADD CONSTRAINT "taverns_id_primary" PRIMARY KEY("id");
CREATE TABLE "Locations"(
    "id" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Locations" ADD CONSTRAINT "locations_id_primary" PRIMARY KEY("id");
CREATE TABLE "Users"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "RoleID" INT NOT NULL,
    "UserStatusID" INT,
    "UserClassLevelID" INT NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Birthdays" DATE,
    "Cakedays" DATE,
    "Notes" VARCHAR(255)
);
ALTER TABLE
    "Users" ADD CONSTRAINT "users_id_primary" PRIMARY KEY("ID");
CREATE TABLE "Roles"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Description" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Roles" ADD CONSTRAINT "roles_id_primary" PRIMARY KEY("ID");
CREATE TABLE "UserStatus"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "UserStatus" ADD CONSTRAINT "userstatus_id_primary" PRIMARY KEY("ID");
CREATE TABLE "Class"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Class" ADD CONSTRAINT "class_id_primary" PRIMARY KEY("ID");
CREATE TABLE "TavernSupplies"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "TavernID" INT NOT NULL,
    "SupplyID" INT NOT NULL,
    "Amount" INT NOT NULL,
    "Date" DATETIME
);
ALTER TABLE
    "TavernSupplies" ADD CONSTRAINT "tavernsupplies_id_primary" PRIMARY KEY("ID");
CREATE TABLE "TavernSuppliesReceived"(
    "TavernID" INT NOT NULL,
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "SupplyID" INT NOT NULL,
    "Cost" INT NOT NULL,
    "Amount" INT NOT NULL,
    "DateUpdated" DATETIME
);
ALTER TABLE
    "TavernSuppliesReceived" ADD CONSTRAINT "tavernsuppliesreceived_id_primary" PRIMARY KEY("ID");
CREATE TABLE "Supply"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "UnitOfMeasurement" VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Supply" ADD CONSTRAINT "supply_id_primary" PRIMARY KEY("ID");
CREATE TABLE "TavernUsers"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "UserID" INT NOT NULL,
    "TavernID" INT NOT NULL
);
ALTER TABLE
    "TavernUsers" ADD CONSTRAINT "tavernusers_id_primary" PRIMARY KEY("ID");
CREATE TABLE "Sales"(
    "TavernUserID" INT NOT NULL,
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Price" INT NOT NULL,
    "Amount" INT NOT NULL,
    "Date" DATETIME,
);
ALTER TABLE
    "Sales" ADD CONSTRAINT "sales_id_primary" PRIMARY KEY("ID");
CREATE TABLE "Services"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Services" ADD CONSTRAINT "services_id_primary" PRIMARY KEY("ID");
CREATE TABLE "TavernServiceSales"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "SalesID" INT NOT NULL,
    "TavernServiceID" INT NOT NULL
);
ALTER TABLE
    "TavernServiceSales" ADD CONSTRAINT "tavernservicesales_id_primary" PRIMARY KEY("ID");
CREATE TABLE "TavernSupplyReceivedSales"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "SalesID" INT NOT NULL,
    "TavernSupplyReceivedID" INT NOT NULL
);
ALTER TABLE
    "TavernSupplyReceivedSales" ADD CONSTRAINT "tavernsupplyreceivedsales_id_primary" PRIMARY KEY("ID");

CREATE TABLE "TavernServices"(
    "TavernID" INT NOT NULL,
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "ServicesID" INT NOT NULL,
    "ServiceStatusID" INT NOT NULL
);
ALTER TABLE
    "TavernServices" ADD CONSTRAINT "tavernservices_id_primary" PRIMARY KEY("ID");
CREATE TABLE "ServiceStatus"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "ServiceStatus" ADD CONSTRAINT "servicestatus_id_primary" PRIMARY KEY("ID");
CREATE TABLE "UserClassLevel"(
    "ID" INT IDENTITY(1, 1) NOT NULL,
    "ClassID" INT NOT NULL,
    "Level" INT NOT NULL
);
ALTER TABLE
    "UserClassLevel" ADD CONSTRAINT "userclasslevel_id_primary" PRIMARY KEY("ID");



/* ALTERING FOREIGN KEYS */
ALTER TABLE
    "Taverns" ADD CONSTRAINT "taverns_locationid_foreign" FOREIGN KEY("LocationID") REFERENCES "Locations"("id");
ALTER TABLE
    "TavernUsers" ADD CONSTRAINT "tavernusers_tavernid_foreign" FOREIGN KEY("TavernID") REFERENCES "Taverns"("id");
ALTER TABLE
    "TavernUsers" ADD CONSTRAINT "tavernusers_userid_foreign" FOREIGN KEY("UserID") REFERENCES "Users"("ID");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_roleid_foreign" FOREIGN KEY("RoleID") REFERENCES "Roles"("ID");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_userstatusid_foreign" FOREIGN KEY("UserStatusID") REFERENCES "UserStatus"("ID");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_userclasslevelid_foreign" FOREIGN KEY("UserClassLevelID") REFERENCES "UserClassLevel"("ID");
ALTER TABLE
    "UserClassLevel" ADD CONSTRAINT "userclasslevel_classid_foreign" FOREIGN KEY("ClassID") REFERENCES "Class"("ID");
ALTER TABLE
    "TavernSuppliesReceived" ADD CONSTRAINT "tavernsuppliesreceived_tavernid_foreign" FOREIGN KEY("TavernID") REFERENCES "Taverns"("id");
ALTER TABLE
    "TavernSuppliesReceived" ADD CONSTRAINT "tavernsuppliesreceived_supplyid_foreign" FOREIGN KEY("SupplyID") REFERENCES "Supply"("ID");
ALTER TABLE
    "TavernSupplies" ADD CONSTRAINT "tavernsupplies_supplyid_foreign" FOREIGN KEY("SupplyID") REFERENCES "Supply"("ID");
ALTER TABLE
    "TavernSupplies" ADD CONSTRAINT "tavernsupplies_tavernid_foreign" FOREIGN KEY("TavernID") REFERENCES "Taverns"("id");
ALTER TABLE
    "TavernServiceSales" ADD CONSTRAINT "tavernservicesales_salesid_foreign" FOREIGN KEY("SalesID") REFERENCES "Sales"("ID");
ALTER TABLE
    "Sales" ADD CONSTRAINT "sales_tavernuserid_foreign" FOREIGN KEY("TavernUserID") REFERENCES "TavernUsers"("ID");
ALTER TABLE
    "TavernServices" ADD CONSTRAINT "tavernservices_servicesid_foreign" FOREIGN KEY("ServicesID") REFERENCES "Services"("ID");
ALTER TABLE
    "TavernServices" ADD CONSTRAINT "tavernservices_servicestatusid_foreign" FOREIGN KEY("ServiceStatusID") REFERENCES "ServiceStatus"("ID");
ALTER TABLE
    "TavernSupplyReceivedSales" ADD CONSTRAINT "tavernsupplyreceivedsales_salesid_foreign" FOREIGN KEY("SalesID") REFERENCES "Sales"("ID");
ALTER TABLE
    "TavernSupplyReceivedSales" ADD CONSTRAINT "tavernsupplyreceivedsales_tavernsupplyreceivedid_foreign" FOREIGN KEY("TavernSupplyReceivedID") REFERENCES "TavernSuppliesReceived"("ID");
ALTER TABLE
    "TavernServiceSales" ADD CONSTRAINT "tavernservicesales_tavernserviceid_foreign" FOREIGN KEY("TavernServiceID") REFERENCES "TavernServices"("ID");
ALTER TABLE
    "TavernServices" ADD CONSTRAINT "tavernservices_tavernid_foreign" FOREIGN KEY("TavernID") REFERENCES "Taverns"("id");
