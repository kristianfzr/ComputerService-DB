-- Create database
CREATE database ComputerService;

USE ComputerService;

-- Create table Customers
CREATE Table Customers(
Customer_id int,
LastName varchar(255),
FirstName varchar(255),
Email varchar(255),
Phone char(10),
PRIMARY KEY (Customer_id)
);

-- Create table Computers
CREATE TABLE Computers(
Computer_id int,
Computer_model varchar(64),
Customer_id int,
InDate DATE,
OutDate DATE,
PRIMARY KEY(Computer_id),
FOREIGN KEY (Customer_id) REFERENCES customers(Customer_id)
);

-- Create table Parts

CREATE TABLE Parts(
Part_id nvarchar(32),
PartName VARCHAR(64),
Part_price decimal(10),
Part_type nvarchar(32),
PRIMARY KEY (Part_id)
);

-- Create table Diagnostic

CREATE TABLE Diagnostic(
Computer_id int,
Customer_id int,
Service_order int,
Diagnostic_info varchar(255),
PRIMARY KEY (Service_order),
FOREIGN KEY (Computer_id) REFERENCES Computers(Computer_id),
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);
-- Create table Result
CREATE TABLE Result(
Result_id int,
Service_order int,
Computer_id int,
Customer_id int,
Part_id NVARCHAR(32),
Add_work DECIMAL(10),
Diagnostic_info VARCHAR(255),
Total_cost DECIMAL(10),
PRIMARY KEY (Result_id),
FOREIGN KEY (Service_order) REFERENCES Diagnostic(Service_order),
FOREIGN KEY (Computer_id) REFERENCES Computers(Computer_id),
FOREIGN KEY (Customer_id)  REFERENCES Customers(Customer_id),
FOREIGN KEY (Part_id) REFERENCES Parts(Part_id)
);

-- Insert into Customers
INSERT INTO Customers()
VALUES(1, 'Dimitrov', 'Ivan','dimitrov.i@gmail.com','0883887266')
INSERT INTO Customers()
VALUES(2, 'Nikolaev', 'Stanislav','stan.nikolaev','0898372612')
INSERT INTO Customers()
VALUES(3, 'Kostadinov', 'Daniel','daniel.kostadinov','0888448921')
INSERT INTO Customers()
VALUES(4, 'Ivanov', 'NIkolay','niki.ivanov@gmail.com','0883717365')


-- Insert into Computers
INSERT INTO Computers ()
VALUES (1, 'HP Pavilion Gaming 15-cx0010nu 4FM60EA',1, 20190119, NULL)

INSERT INTO Computers ()
VALUES (2, 'Lenovo V330 81AX00DWBM',2, 20190120, NULL)

INSERT INTO Computers ()
VALUES (3, 'HP 15 4GZ29EA',3, 20190121, NULL)

INSERT INTO Computers ()
VALUES (4, 'Lenovo Legion Y530 81FV00UWBM',4, 20190122, NULL)

-- Insert into Parts
INSERT INTO Parts()
VALUES(1, 'CPU-i3', 100)
INSERT INTO Parts()
VALUES(2, 'CPU-i5', 150)
INSERT INTO Parts()
VALUES(3, 'CPU-i7', 200)
INSERT INTO Parts()
VALUES(4, 'CPU-i9', 250)
INSERT INTO Parts()
VALUES(5, 'Motherboard-AsRock', 75)
INSERT INTO Parts()
VALUES(6, 'Motherboard-ASUS', 125)
INSERT INTO Parts()
VALUES(7, 'Motherboard-Gigabyte', 150)
INSERT INTO Parts()
VALUES(8, 'RAM-2GB', 40,'RAM')
INSERT INTO Parts()
VALUES(9, 'RAM-4GB', 80,'RAM')
INSERT INTO Parts()
VALUES(10, 'RAM-8GB', 120,'RAM')
INSERT INTO Parts()
VALUES(11, 'RAM-16GB', 240,'RAM')
INSERT INTO Parts()
VALUES(12, 'HDD-500GB', 80,'HDD')
INSERT INTO Parts()
VALUES(13, 'HDD-750GB', 105,'HDD')
INSERT INTO Parts()
VALUES(14, 'HDD-1000GB', 135,'HDD')
INSERT INTO Parts()
VALUES(15, 'HDD-1500GB', 165,'HDD')
INSERT INTO Parts()
VALUES(16, 'HDD-2000GB', 180,'HDD')

-- Insert into Diagnostic
INSERT INTO Diagnostic()
VALUES(1, 1, 1,'RAM Upgraded')
INSERT INTO Diagnostic()
VALUES(3, 3, 3,'SSD Added')

-- Insert into Result
INSERT INTO result()
VALUES(1,1, 1, 1, 9, 0, 'RAM-4GB Upgraded', 80)
INSERT INTO result()
VALUES(2,2, 3, 3, 20, 10, 'RAM-4GB Upgraded', 210)
