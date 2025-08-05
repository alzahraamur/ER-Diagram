create database CompanyDB;

CREATE TABLE Department (
    DNUM INT PRIMARY KEY,
    SSN INT,
	DName VARCHAR(50),
    HireDate DATE
);

CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Gender CHAR(1),
    Super_ID INT,
    BirthDate DATE,
    DNUM INT,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

ALTER TABLE Department
ADD CONSTRAINT FK_Department_Manager
FOREIGN KEY (SSN) REFERENCES Employee(SSN);

CREATE TABLE DepartmentLocation (
    DNUM INT,
    LOC VARCHAR(100),
    PRIMARY KEY (DNUM, LOC),
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

CREATE TABLE PROJECT (
    PNUM INT PRIMARY KEY,
    PName VARCHAR(100),
    LOC VARCHAR(100),
    CITY VARCHAR(50),
    DNUM INT,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

CREATE TABLE WORK (
    SSN INT,
    PNUM INT,
    Hours DECIMAL(5,2),
    PRIMARY KEY (SSN, PNUM),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (PNUM) REFERENCES PROJECT(PNUM)
);

CREATE TABLE DEPENDENT (
    DepName VARCHAR(50),
    BirthDate DATE,
    Gender CHAR(1),
    SSN INT,
    PRIMARY KEY (DepName, SSN),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);
