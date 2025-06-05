CREATE DATABASE DEMO;
USE DEMO;

create table dept(
deptid varchar(2) primary key,
dname varchar(20) not null
);

create table employee(
eid int(3) primary key,
ename varchar(20),
deptid varchar(2),
designation varchar(20),
salary int,
doj date,
foreign key (deptid) references dept(deptid),
check(salary>10000)
);

INSERT INTO DEPT VALUES('D1','SALES');
INSERT INTO DEPT VALUES('D2','MARKETING');
INSERT INTO DEPT VALUES('D3','FINANCE');
INSERT INTO EMPLOYEE VALUES(101,'SUDHA','D2','CLERK',20000,'2010-04-01');
INSERT INTO EMPLOYEE VALUES(102,'DAVID','D1','MANAGER',50000,'2018-02-18');
INSERT INTO EMPLOYEE VALUES(103,'PREETHI','D3','CLERK',35000,'2011-06-11');
INSERT INTO EMPLOYEE VALUES(104,'KIRAN','D1','SALESMAN',20000,'2014-03-07');
INSERT INTO EMPLOYEE VALUES(105,'MEENAL','D2','CLERK',50000,'2011-12-09');
INSERT INTO EMPLOYEE VALUES(106,'SUNITHA','D3','MANAGER',60000,'2018-09-18');
INSERT INTO EMPLOYEE VALUES(107,'AKHIL','D3','CLERK',25000,'2016-02-14');
INSERT INTO EMPLOYEE VALUES(108,'SUSHMA','D2','MANAGER',45000,'2012-12-31');

select * from employee where salary >(select avg(salary) from employee );

select 
employee.eid,
employee.ename,
dept.dname
from employee
inner join dept on dept.deptid=employee.deptid;


select * from employee
order by salary desc;


select distinct designation from employee;

select * from employee 
order by deptid asc,
salary desc;

select * from employee
where deptid="d2" and designation="clerk";

SELECT * FROM EMPLOYEE JOIN DEpT ON EMPLOYEE.DEPTID=DEPT.DEPTID WHERE DEPT.DEPTID='D2' AND DESIGNATION='CLERK';

select * from employee
where doj>"2011-01-01";

select * from employee
where month(doj)=2;


select * from employee
where salary between 30000 and 45000;


SELECT EID,ENAME,doj,DATEDIFF(DATE(NOW()), DOJ)/365 AS EXP FROM EMPLOYEE;

SELECT EID,ENAME,DOJ, DATEDIFF(DATE(NOW()),DOJ)/365 AS EXP FROM EMPLOYEE;

-- TRIGGER TO PREVENT DELETION

DELIMITER $$
CREATE TRIGGER PREVENT
BEFORE DELETE ON EMPLOYEE
FOR EACH ROW
BEGIN

SIGNAL SQLSTATE "45000"
SET MESSAGE_TEXT="NO DELETION";


END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER PREVENT
AFTER INSERT ON EMPLOYEE
FOR EACH ROW

BEGIN

UPDATE PRODUCT
SET QTYINSTOCK=PRODUCT.QTYINSTOCK-NEW.QTY
WHERE PDTID=NEW.PDTID



END $$
DELIMITER ;
