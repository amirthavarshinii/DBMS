-- This SQL demonstrates the use of self join.
--

CREATE SCHEMA IF NOT EXISTS selfjoin;
USE selfjoin;

DROP TABLE IF EXISTS Assignment;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Team;

CREATE TABLE Student (
studentKey int PRIMARY KEY,
fullName VARCHAR(300)
);

CREATE TABLE Team (
teamKey char PRIMARY KEY,
teamName VARCHAR(300)
);

CREATE TABLE Assignment (
studentFK int,
teamFK char
);

INSERT INTO Team VALUES
   ('A','alpha team'),
   ('B','bravo team'),
   ('C','charlie team');

INSERT INTO Student VALUES
   (1,'Andi'),
   (2,'Bri'),
   (3,'Charlie');

INSERT INTO Assignment VALUES
   (1,'A'),
   (2,'A'),
   (2,'B');

SELECT *
 FROM Assignment
WHERE  teamFK='A' AND teamFK='B';

SELECT *
 FROM Assignment a1
JOIN Assignment a2 ON a1.StudentFK=a2.StudentFK
WHERE 
       a1.TeamFK = 'A' AND a2.TeamFK = 'B';
