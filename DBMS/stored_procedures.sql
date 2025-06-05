CREATE DATABASE STORE;
USE STORE;

CREATE TABLE PRODUCT
(PDTID VARCHAR(4)PRIMARY KEY,
PNAME VARCHAR(20),
PRICE DOUBLE(5,2),
QUANTITY INT(3));

drop database store;

call INSERT_PRODUCT(1001,"pen",10.00,50);
call Insert_product(1002,"Pencil",5.75,15);
call Insert_product(1003,"Book",25,9);
call Insert_product(1004,"Boosk",29,8);

 call Insert_product(1004,"Eraser",-2,20);
 call Insert_product(1005,"Paper",1.25,-10);
 call Insert_product(1006,"Sharpner",-2.5,-20);

select * from product;


CALL FACTORIAL(5);
