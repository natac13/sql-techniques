drop database IF EXISTS foundation;

create database foundation;

USE foundation;

DROP TABLE IF EXISTS `Customers`;

CREATE TABLE `Customers` (
	`CustomerId` INT AUTO_INCREMENT NOT NULL,
	`FirstName` varchar(50) NOT NULL,
	`LastName` varchar(50) NOT NULL,
	CONSTRAINT `PK_Customers_CustomerId` PRIMARY KEY CLUSTERED (`CustomerId` ASC)
) DEFAULT CHARSET = utf8;

INSERT INTO
	`Customers` (`FirstName`, `LastName`)
VALUES
	('John', 'Doe'),
	('Jane', 'Doe'),
	('Alex', 'Smith'),
	('Jane', 'Smith');

-- GO
DROP TABLE IF EXISTS `Items`;

CREATE TABLE `Items` (
	`ItemId` INT AUTO_INCREMENT NOT NULL,
	`Name` VARCHAR(50) NOT NULL,
	`Cost` DECIMAL(5, 2) NOT NULL,
	CONSTRAINT `PK_Items_ItemId` PRIMARY KEY CLUSTERED (`ItemId` ASC)
);

-- -- GO 
INSERT INTO
	`Items` (`Name`, `Cost`)
VALUES
	('Apple', 0.49),
	('Orange', 0.55),
	('Banana', 0.25),
	('Basket', 7.99);

-- GO
DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
	`OrderId` INT AUTO_INCREMENT NOT NULL,
	`CustomerId` INT NOT NULL,
	CONSTRAINT `PK_Orders_OrderId` PRIMARY KEY CLUSTERED (`OrderId` ASC),
	CONSTRAINT `FK_Orders_Customers_CustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `Customers`(`CustomerId`)
);

CREATE INDEX `IX_Orders_CustomerId` ON `Orders` (`CustomerId`);

-- -- GO 
INSERT INTO
	`Orders` (`CustomerId`)
VALUES
	(1),
	(1),
	(2),
	(2),
	(3),
	(3);

-- GO
drop table if exists `Orderitems`;

CREATE TABLE `OrderItems` (
	`OrderItemId` INT AUTO_INCREMENT NOT NULL,
	`OrderId` INT NOT NULL,
	`ItemId` INT NOT NULL,
	`Count` INT,
	CONSTRAINT `PK_OrderItems_OrderItemId` PRIMARY KEY CLUSTERED (`OrderItemId` ASC),
	CONSTRAINT `FK_OrderItems_Orders_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `Orders`(`OrderId`),
	CONSTRAINT `FK_OrderItems_Items_ItemId` FOREIGN KEY (`ItemId`) REFERENCES `Items`(`ItemId`)
);

CREATE INDEX `IX_OrderItems_CustomerId` ON `OrderItems` (`OrderId`);

CREATE INDEX `IX_OrderItems_ItemId` ON `OrderItems` (`ItemId`);

-- GO 
INSERT INTO
	`OrderItems` (`OrderId`, `ItemId`, `Count`)
VALUES
	(1, 1, 5),
	(1, 2, 2),
	(1, 4, 1),
	(2, 3, 3),
	(2, 2, 3),
	(3, 1, 2),
	(3, 4, 1),
	(4, 3, 10),
	(4, 2, 10),
	(5, 1, 15),
	(6, 2, 2),
	(6, 3, 3),
	(3, 1, 3);

-- GO
DROP TABLE IF EXISTS `LogicalTests`;

CREATE TABLE `LogicalTests` (
	`LogicalTestId` INT AUTO_INCREMENT NOT NULL,
	`Value` INT,
	`Text` VARCHAR(5) NOT NULL,
	`Category` VARCHAR(4),
	CONSTRAINT `PK_LogicalTests_LogicalTestId` PRIMARY KEY CLUSTERED (`LogicalTestId` ASC)
);

-- GO
INSERT INTO
	`LogicalTests` (`Value`, `Text`, `Category`)
VALUES
	(1, 'ONE', 'ODD'),
	(2, 'TWO', 'EVEN'),
	(3, 'THREE', 'ODD'),
	(4, 'FOUR', 'EVEN'),
	(5, 'FIVE', 'ODD'),
	(6, 'SIX', 'EVEN'),
	(7, 'SEVEN', 'ODD'),
	(8, 'EIGHT', 'EVEN'),
	(9, 'NINE', 'ODD'),
	(null, 'NULL', 'NULL');

-- GO
DROP TABLE IF EXISTS `TableA`;

CREATE TABLE `TableA` (
	`TableAId` INT AUTO_INCREMENT NOT NULL,
	`Text` VARCHAR(5) NOT NULL,
	CONSTRAINT `PK_TableA_TableAId` PRIMARY KEY CLUSTERED (`TableAId` ASC)
);

-- GO
INSERT INTO
	`TableA` (`Text`)
VALUES
	('FOO'),
	('BAR'),
	('BAZ'),
	('QUX');

-- GO
DROP TABLE IF EXISTS `TableB`;

CREATE TABLE `TableB` (
	`TableBId` INT AUTO_INCREMENT NOT NULL,
	`Text` VARCHAR(5) NOT NULL,
	CONSTRAINT `PK_TableB_TableBId` PRIMARY KEY CLUSTERED (`TableBId` ASC)
);

-- GO
INSERT INTO
	`TableB` (`Text`)
VALUES
	('QUUX'),
	('FOO'),
	('CORGE'),
	('BAR');

-- GO
DROP TABLE IF EXISTS `Employee`;

CREATE TABLE `Employee` (
	`EmployeeId` INT AUTO_INCREMENT NOT NULL,
	`FirstName` VARCHAR(50) NOT NULL,
	`LastName` VARCHAR(50) NOT NULL,
	`ReportsTo` INT NULL,
	CONSTRAINT `PK_Employee_EmployeeId` PRIMARY KEY CLUSTERED (`EmployeeId` ASC),
	CONSTRAINT `FK_Employee_Employee_ReportsTo_EmployeeId` FOREIGN KEY (`ReportsTo`) REFERENCES `Employee`(`EmployeeId`)
);

-- GO
INSERT INTO
	`Employee` (`FirstName`, `LastName`, `ReportsTo`)
VALUES
	('Amanda', 'Schultz', NULL),
	('Irene', 'Joseph', 1),
	('Oliver', 'Stevens', 1),
	('Sam', 'Cannon', 1),
	('Abbey', 'Rose', 2),
	('Amanda', 'Bell', 2),
	('Bernice', 'Beasley', 2),
	('Tobey', 'Mackay', 3),
	('Jason', 'Jones', 3),
	('Oliver', 'Bell', 3),
	('Martha', 'Stanton', 3),
	('Zara', 'Castro', 3),
	('Callen', 'Quinn', 4),
	('Darci', 'Brock', 4),
	('Jean', 'Spencer', 4),
	('Oliver', 'Wynn', 4),
	('Amanda', 'Rose', 4),
	('Sam', 'Jeffries', 5),
	('Jason', 'Bell', 5),
	('Abbey', 'Stevens', 5),
	('Jason', 'Jones', 5);

-- GO