CREATE TABLE IF NOT EXISTS course(
	num VARCHAR(300) PRIMARY KEY NOT NULL, 
    title VARCHAR(300) NOT NULL,
    lengthindays INTEGER NOT NULL,   
    tution DOUBLE(10,2) NOT NULL	
); 

CREATE TABLE IF NOT EXISTS module(
	mid INTEGER PRIMARY KEY NOT NULL,
    title VARCHAR(300) NOT NULL,
    lengthinminutes INTEGER NOT NULL,
    d_id VARCHAR(300) NOT NULL,
    aid INTEGER NOT NULL,
    FOREIGN KEY(aid) REFERENCES author ON DELETE CASCADE,
	FOREIGN KEY(d_id) REFERENCES difficultytable ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS difficultytable(
	d_id INTEGER PRIMARY KEY NOT NULL,
	difficulty VARCHAR(300) NOT NULL
);

CREATE TABLE IF NOT EXISTS coursetopic(
	num VARCHAR(300) NOT NULL,
    mid INTEGER NOT NULL,
    PRIMARY KEY(num, mid),
    FOREIGN KEY(num) REFERENCES course(num),
    FOREIGN KEY(mid) REFERENCES module(mid)
); 

CREATE TABLE IF NOT EXISTS author(
	aid INTEGER PRIMARY KEY NOT NULL,
    name varchar(300) NOT NULL,
    c_id VARCHAR(300) NOT NULL,
    FOREIGN KEY(c_id) REFERENCES certificatetable ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS certificatetable(
	c_id INTEGER PRIMARY KEY NOT NULL,
	certifications VARCHAR(300) NOT NULL
);

CREATE TABLE IF NOT EXISTS email(
	id INTEGER PRIMARY KEY NOT NULL,
    email VARCHAR(300) NOT NULL,
    aid INTEGER NOT NULL,
    FOREIGN KEY(aid) REFERENCES author(aid) ON DELETE CASCADE
); 

-- Insert Statements:
INSERT INTO difficultytable VALUES (1, "intro");
INSERT INTO difficultytable VALUES (2, "inter");
INSERT INTO difficultytable VALUES (3, "adv");

INSERT INTO certificatetable VALUES (1, "PMP");
INSERT INTO certificatetable VALUES (2, "CBAP");
INSERT INTO certificatetable VALUES (3, "CSM");
INSERT INTO certificatetable VALUES (4, "CSTE");
INSERT INTO certificatetable VALUES (4, "CAP");

-- Assumptions: 
-- certificatetable and difficultytable are lookups table containing the values intro, inter, adv and  PMP, CBAP, CSM, CSTE, CAP respectively. 
-- There exists a cyclic dependency between author table and email table therefore I am assuming that each author ID must appear at least once in email table and by setting aid in email table to be not null, I am making sure every author will have at least one email. 

