CREATE TABLE Employee(
idEmployee int auto_increment PRIMARY KEY,
Fname INT not null,
Minit INT not null,
Lname INT not null,
Ssn varchar(12),
Bdate DATE not null,
Adress TEXT not null,
Sex ENUM('mulher','homem') NOT NULL,
Salary FLOAT,
Super_ssn INT,
Dno int
);
CREATE TABLE Departament(
idDepartament int auto_increment PRIMARY KEY,
Dname INT not null,
Dnumber INT not null,
Mgr_ssn varchar(12),
Mgr_start_date DATE
);
CREATE TABLE Dep_Location(
idDep_Location int auto_increment PRIMARY KEY,
Dnumber INT not null,
constraint Dnumber_depart foreign key (Dnumber) references Departament(Dnumber)
);
CREATE TABLE Project(
idProject INT auto_increment PRIMARY KEY,
Pname VARCHAR(30) not null,
Pnumber INT not null,
Plocation TEXT(550),
Dnum INT
);
CREATE TABLE Works_on(
idWorks_on INT auto_increment PRIMARY KEY,
Essn INT,
Pno INT,
Hours DATE
);
CREATE TABLE Dependent(
idDependent INT auto_increment PRIMARY KEY,
idEmployee INT,
Essn INT,
Dependent_name varchar(20),
Sex ENUM('mulher','homem') NOT NULL,
BDate DATE,
Relationship VARCHAR(30),
constraint fk__idEmployee foreign key (idEmployee)references Employee(idEmployee)
);

CREATE INDEX idx_Employee on Employee(idEmployee);
CREATE INDEX idx_Dependent on Dependent(idDependent);

CREATE PROCEDURE verSalario (varSalario int)
SELECT CONCAT('O salario é ',Salary) AS salario
FROM Employee WHERE idEmployee=varSalario;
CALL verSalario;

