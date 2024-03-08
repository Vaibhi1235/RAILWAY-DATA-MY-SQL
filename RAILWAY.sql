CREATE DATABASE railway;
USE railway;
CREATE TABLE railway( 
bookingID INT PRIMARY KEY,
journey date,
boardinglocation varchar(50),
destination varchar(50),
AMOOUNT int );
CREATE TABLE pnr (
bookingid INT PRIMARY KEY, 
name VARCHAR(50), 
pnr INT, 
foreign key (pnr) references railway(bookingid)
ON UPDATE CASCADE
ON DELETE CASCADE);
INSERT INTO railway values
(1004,"2024-03-24","pune","mumbai",500),
(1005,"2024-04-24","pune","kolkata",1500),
(1006,"2024-03-25","mumbai","pune",450),
(1007,"2024-03-21","pune","banaras",1200),
(1008,"2024-03-21","pune","kolhapur",300);
INSERT INTO pnr values
(1004,"vaibhavi",1004),
(1005,"vaibhav",1005),
(1006,"suresh",1006),
(1007,"shailesh",1007),
(1008,"manish",1008);
SET SQL_SAFE_UPDATES= 0;
UPDATE pnr SET name="vaibhi" where name="vaibhav";
SELECT*FROM railway ORDER BY "city" desc;
SELECT*FROM railway where AMOOUNT>500;
SELECT destination, count(bookingid) 
from railway 
GROUP BY destination
HAVING max(AMOOUNT)>600;

