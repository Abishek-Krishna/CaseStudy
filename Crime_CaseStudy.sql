CREATE DATABASE CRIME
USE CRIME
CREATE TABLE Incidents (
  IncidentID INT PRIMARY KEY,
  IncidentType VARCHAR(50),
  IncidentDate DATE,
  LocationX INT, 
  LocationY INT,
  Description TEXT,
  Status VARCHAR(50),
  VictimID INT FOREIGN KEY REFERENCES Victims(VictimID),
  SuspectID INT FOREIGN KEY REFERENCES Suspects(SuspectID)
);

CREATE TABLE Victims (
  VictimID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  DateOfBirth DATE,
  Gender VARCHAR(10),
  ContactInfo VARCHAR(255)
);
INSERT INTO Victims (VictimID, FirstName, LastName, DateOfBirth, Gender, ContactInfo)
VALUES ('1011', 'Lokesh', 'Raj', '1982-12-12', 'Male', '98753678'),
       ('1012', 'Suresh', 'Kumar', '1983-06-05', 'Male', '987654321'),
       ('1013', 'Harish', 'Singh', '1990-09-12', 'Male', '876543210'),
       ('1014', 'Rajesh', 'Patel', '1986-03-18', 'Male', '765432109'),
       ('1015', 'Mukesh', 'Sharma', '1989-11-30', 'Male', '654321098'),
       ('1016', 'Anjali', 'Desai', '1992-07-14', 'Female', '543210987'),
       ('1017', 'Amit', 'Shah', '1980-05-22', 'Male', '432109876'),
       ('1018', 'Sonia', 'Verma', '1984-11-08', 'Female', '321098765'),
       ('1019', 'Vijay', 'Gupta', '1977-02-19', 'Male', '210987654'),
       ('1020', 'Priya', 'Rajput', '1995-09-25', 'Female', '109876543');
CREATE TABLE Suspects (
  SuspectID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  DateOfBirth DATE,
  Gender VARCHAR(10),
  ContactInfo VARCHAR(255)
);
INSERT INTO Suspects (SuspectID, FirstName, LastName, DateOfBirth, Gender, ContactInfo)
VALUES ('2001', 'Amit', 'Kumar', '1985-04-12', 'Male', '987654321'),
       ('2002', 'Priya', 'Sharma', '1990-08-27', 'Female', '876543210'),
       ('2003', 'Rajesh', 'Patil', '1982-03-05', 'Male', '765432109'),
       ('2004', 'Neha', 'Singh', '1994-11-18', 'Female', '654321098'),
       ('2005', 'Vikram', 'Mishra', '1987-07-22', 'Male', '543210987'),
       ('2006', 'Ananya', 'Verma', '1991-02-10', 'Female', '432109876'),
       ('2007', 'Rahul', 'Gupta', '1980-06-15', 'Male', '321098765'),
       ('2008', 'Pooja', 'Joshi', '1989-09-30', 'Female', '210987654'),
       ('2009', 'Sanjay', 'Khan', '1984-12-25', 'Male', '109876543'),
       ('2010', 'Kavita', 'Rajput', '1993-05-08', 'Female', '012345678');

CREATE TABLE LawEnforcementAgencies (
  AgencyID INT PRIMARY KEY,
  AgencyName VARCHAR(255),
  Jurisdiction VARCHAR(255),
  ContactInfo VARCHAR(255)
);
INSERT INTO LawEnforcementAgencies (AgencyID, AgencyName, Jurisdiction, ContactInfo)
VALUES (1, 'Police', 'City', '1234567'),
       (2, 'CBI', 'National', '9876543'),
       (3, 'RAW', 'International', '5678901'),
       (4, 'Military', 'National', '2345678'),
       (5, 'Police', 'City', '8765432'),
       (6, 'CBI', 'National', '3456789'),
       (7, 'RAW', 'International', '7890123'),
       (8, 'Military', 'National', '2109876'),
       (9, 'Police', 'City', '6543210'),
       (10, 'CBI', 'National', '5432109');

CREATE TABLE Officers (
  OfficerID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  BadgeNumber VARCHAR(20),
  Rank VARCHAR(50),
  ContactInfo VARCHAR(255),
  AgencyID INT FOREIGN KEY REFERENCES LawEnforcementAgencies(AgencyID)
);
CREATE TABLE Evidence (
  EvidenceID INT PRIMARY KEY,
  Description TEXT,
  LocationFound VARCHAR(255),
  IncidentID INT FOREIGN KEY REFERENCES Incidents(IncidentID)
);
insert into Evidence (EvidenceID, description, LocationFound, IncidentID) values 
('2010', 'Floor Bloodstains', 'Living Room', '2'),
('2011', 'Backyard Glass', 'Backyard', '3'),
('2012', 'Warehouse Note', 'Warehouse', '4'),
('2013', 'Wall Cans', 'Street Wall', '5'),
('2014', 'Residence Documents', 'Residence', '6'),
('2015', 'Site Plate', 'Accident Site', '7'),
('2016', 'Scene Photos', 'Scene', '8'),
('2017', 'Tire Tracks', 'Driveway', '9'),
('2018', 'Witness Testimony', 'Interview Room', '10');

CREATE TABLE Reports (
  ReportID INT PRIMARY KEY,
  IncidentID INT FOREIGN KEY REFERENCES Incidents(IncidentID),
  ReportingOfficerID INT FOREIGN KEY REFERENCES Officers(OfficerID),
  ReportDate DATE,
  ReportDetails TEXT,
  Status VARCHAR(50)
);
INSERT INTO Reports(IncidentID, ReportID, ReportingOfficerID, ReportDate, ReportDetails, Status)
VALUES ('1', '1', '1', '2024-03-07', 'Incident 1 details', 'Open'),
       ('2', '2', '2', '2024-03-08', 'Incident 2 details', 'Closed'),
       ('3', '3', '3', '2024-03-09', 'Incident 3 details', 'Open'),
       ('4', '4', '4', '2024-03-10', 'Incident 4 details', 'Closed'),
       ('5', '5', '5', '2024-03-11', 'Incident 5 details', 'Open'),
       ('6', '6', '6', '2024-03-12', 'Incident 6 details', 'Closed'),
       ('7', '7', '7', '2024-03-13', 'Incident 7 details', 'Open'),
       ('8', '8', '8', '2024-03-14', 'Incident 8 details', 'Closed'),
       ('9', '9', '9', '2024-03-15', 'Incident 9 details', 'Open'),
       ('10', '10', '10', '2024-03-16', 'Incident 10 details', 'Closed');

select * from Suspects
select * from Victims 
select * from Incidents 
select * from Reports 
select * from Officers
select * from Evidence 
select * from LawEnforcementAgencies 
