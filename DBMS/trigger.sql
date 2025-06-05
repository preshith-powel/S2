create database store;
use store;

create table product(
pdtid int primary key,
pname varchar(20),
price double(5,2),
qtyinstock int);

create table sale(
saleid int primary key,
address varchar(50));

create table saleitem(
saleid int,
pdtid int ,
qty int,
foreign key (pdtid) references product(pdtid),
foreign key (saleid) references sale(saleid),
primary key (pdtid,saleid));  


insert into product values
(101,"pencil",5,10),
(102,"pen",3,20);

insert into sale values
(001,"home123"),
(002,"myVilla");



delimiter $$
create trigger updateAvailableQuantity
after insert on saleitem
for each row

begin

update product 
set qtyinstock=product.qtyinstock-new.qty 
where pdtid=new.pdtid;

-- CHECHK FRO NEG STOCK
IF(SELECT QTY_STOCK FROM PRODUCT
WHERE PDTID=NEW.PDTID)<0
THEN 
SIGNAL SQLSTATE "45000"
SET MESSAGE_TEXT="NO NEG";
END IF;


end$$
delimiter ;


select * from product;
select * from saleitem;
select * from sale;


insert into saleitem values (001,102,8);
insert into saleitem values (002,101,3);
insert into saleitem values (002,102,1);


describe sale;
CALL EVEN_ODD(2);