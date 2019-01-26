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
Service_order int,
Computer_id int,
Customer_id int,
Part_id NVARCHAR(32),
Add_work DECIMAL(10),
Diagnostic_info VARCHAR(255),
Total_cost DECIMAL(10),
FOREIGN KEY (Service_order) REFERENCES Diagnostic(Service_order),
FOREIGN KEY (Computer_id) REFERENCES Computers(Computer_id),
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
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