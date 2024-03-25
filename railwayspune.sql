CREATE DATABASE railway;
USE railway;
CREATE TABLE pune_division( 
train_no INT PRIMARY KEY , 
train_name VARCHAR(50), 
start_station VARCHAR(50), 
destination VARCHAR(50), 
category VARCHAR(50));
CREATE TABLE passenger (
PNR bigINT PRIMARY KEY , 
train_no INT,
FOREIGN KEY (train_no) REFERENCES pune_division(train_no)
ON UPDATE CASCADE
ON DELETE CASCADE,
staion VARCHAR(50),
destination VARCHAR(50),
age DATE,
start_journey date,
end_journey date);
CREATE TABLE ticket (
emp_id TINYINT PRIMARY KEY ,
emp_name VARCHAR(50), 
fair INT, 
class VARCHAR(30),
train_no INT,
foreign key (train_no) references pune_division(train_no)
ON UPDATE CASCADE
ON DELETE CASCADE);
CREATE TABLE revenue (
train_name VARCHAR(50), 
train_no INT , 
FOREIGN KEY (train_no) REFERENCES pune_division (train_no),
expenses BIGINT ,
revenue bigint);
INSERT INTO pune_division VALUES
(12157,"hutatma","pune","solapur","express"),
(12528,"latur","latur","mumbai","express"),
(12527,"cstm","mumbai","latur","express"),
(22106,"indrayani","pune","mumbai","express"),
(12297,"duranto","ahmadabad","pune","express"),
(07305,"nizamudin","hubli","nizamudin","express"),
(11029,"koyna","mumbai","kolhapur","express"),
(11033,"darbhanga","pune","darbhanga","express"),
(01552,"special","pune","lonavala","local");
INSERT INTO passenger VALUES
(120789123811,12157,"pune","kurduwadi","1990-07-12","2024-03-12","2024-03-13"),
(129009099399,12157,"daund","solapur","1991-04-23","2024-04-12","2024-04-13"),
(129998388999,12528,"latur","pune","1994-09-29","2024-03-28","2024-03-28"),
(129999939993,12528,"latur","mumbai","1995-03-12","2024-02-12","2024-02-13"),
(125272928399,12527,"mumbai","lonavala","1996-06-14","2024-03-24","2024-03-24"),
(128383838839,22106,"pune","lonavla","1997-08-18","2024-03-28","2024-03-28"),
(129929338888,12297,"ahmadabad","mumbai","1990-09-12","2024-05-21","2024-05-22"),
(122229939388,12297,"mumbai","pune","1993-02-13","2024-08-12","2024-08-21"),
(122239399399,07305,"hubli","kolhapur","1993-01-12","2024-03-12","2024-03-12"),
(122233889489,07305,"hubli","pune","1993-09-11","2024-04-10","2024-04-11"),
(128829383899,11029,"mumbai","kolhapur","1998-09-11","2024-03-18","2024-04-18"),
(129290939390,11029,"pune","sangli","2000-01-12","2024-03-23","2024-03-19"),
(129238899399,11033,"pune","darbhanga","2001-03-13","2024-04-22","2024-04-23"),
(122938388389,01552,"pune","akurdi","2003-03-12","2024-03-25","2024-03-25");
ALTER  TABLE ticket MODIFY emp_id TINYINT;
INSERT INTO ticket VALUES
(101,"vaibhavi",900,"sleeper class",12157),
(102,"vaibhavi",1200,"third ac",12157),
(103,"vaibhav",400,"journal",12528),
(104,"vishal",3000,"first ac",12528),
(105,"vaibhavi",800,"second ac",12527),
(106,"vaibhavi",1000,"sleeper class",22106),
(107,"vaibhav",800,"third ac",12297),
(108,"vaibhav",2000,"second ac",12297),
(109,"vishal",3000,"first ac",07305),
(110,"vishal",700,"journal",07305),
(111,"vaibhavi",1000,"sleeper class",11029),
(112,"vaibhav",900,"journal",11029),
(113,"vishal",3000,"first ac",11033),
(114,"vaibhavi",2000,"second ac",01552);
INSERT INTO revenue VALUES
("hutatma",12157,300000,600000),
("latur",12528,400000,200000),
("cstm",12527,200000,400000),
("indrayani",22106,300000,500000),
("duranto",12297,200000,500000),
("nizamudin",07305,300000,200000),
("koyana",11029,100000,200000),
("darbhanga",11033,300000,200000),
("special",01552,100000,150000);
SELECT * FROM pune_division;
SELECT * FROM passenger;
SELECT * FROM ticket;
SELECT * FROM revenue;
ALTER TABLE ticket CHANGE COLUMN fair price int;
SELECT train_name, count(train_no) FROM pune_division GROUP BY train_name  HAVING MAX(train_no)=12157;
SELECT train_name FROM pune_division WHERE train_no IN (SELECT train_no FROM passenger WHERE end_journey >"2024-01-02");
SELECT DISTINCT train_name FROM pune_division ORDER BY train_name desc;
SELECT*,(expenses-revenue) AS profit_or_loss FROM revenue WHERE expenses-revenue>0;
SELECT train_name FROM pune_division WHERE train_name LIKE("k%");
SELECT curdate();
SELECT datediff(start_journey,end_journey) from passenger;
SELECT *,(curdate())-age FROM passenger;
SELECT date_format(start_journey,"%m-%d-%Y") FROM passenger;
select last_day(start_journey) FROM passenger;
SELECT pune_division.train_name,pune_division.train_no,passenger.pnr FROM pune_division CROSS JOIN passenger;
SELECT pune_division.train_name,pune_division.train_no,passenger.pnr FROM pune_division LEFT JOIN passenger ON pune_division.train_no=passenger.train_no;
SELECT pune_division.train_name,pune_division.train_no,passenger.pnr FROM pune_division RIGHT JOIN passenger ON pune_division.train_no=passenger.train_no;
SELECT *, CASE WHEN price > 800 then "ac class"
when price <800 then "normal class"
ELSE "sadharan" end class
FROM ticket;
SELECT pnr FROM passenger ORDER BY pnr DESC LIMIT 3 OFFSET 2;
SELECT *, concat (train_name ,category) AS trainname FROM pune_division;
SELECT *, substr(train_name,2,3) FROM pune_division;
SELECT *,UPPER (train_name) FROM pune_division;
SELECT *,char_length(train_name) FROM pune_division;
SELECT * FROM ticket WHERE price BETWEEN 800 AND 2000 OR price > 1000;
SELECT price-10 FROM ticket;
SELECT * FROM ticket;

