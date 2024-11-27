use newdatabase;
create table Person (driver_id varchar(10), P_Name varchar(20), address varchar(30),primary key(driver_id));
desc Person;
create table Car(Reg_num varchar(10),Model varchar(10),Year_reg int,primary key(reg_num));
create table Accident(report_num int, accident_date date, location varchar(20),primary key(report_num));
create table Owns(driver_id varchar(10),reg_num varchar(10),primary key(driver_id, reg_num),foreign key(driver_id) references Person(driver_id),foreign key(reg_num) references Car(reg_num));
create table Participated(driver_id varchar(10), reg_num varchar(10),report_num int, damage_amount int,primary key(driver_id, reg_num, report_num),foreign key(driver_id) references Person(driver_id),foreign key(reg_num) references Car(reg_num),foreign key(report_num) references Accident(report_num));
desc Person;
desc Car;
desc Accident;
desc Owns;
desc Participated;
insert into Person values ('A01','Richard','Srinivas Nagar');
insert into Person values ('A02','Pradeep','Rajaji Nagar');
insert into Person values ('A03','Smith','Ashok Nagar');
insert into Person values ('A04','Venu','N R colony');
insert into Person values ('A05','John','Hanumanth Nagar');
select * from Person;
insert into Car values ('KA052250','Indica',1990);
insert into Car values ('KA031181','Lancer',1957);
insert into Car values ('KA095477','Toyota',1998);
insert into Car values ('KA053408','Honda',2008);
insert into Car values ('KA041702','Audi',2005);
select * from Car;
insert into Accident values (11,'2003-01-01','Mysore road');
insert into Accident values (12,'2004-02-02','South end Circle');
insert into Accident values (13,'2003-01-21','Bull temple road');
insert into Accident values (14,'2017-02-08','Mysore road');
insert into Accident values (15,'2005-03-04','Kanakpura road');
select * from Accident;
insert into Owns values ('A01','KA052250');
insert into Owns values ('A02','KA031181');
insert into Owns values ('A03','KA095477');
insert into Owns values ('A04','KA053408');
insert into Owns values ('A05','KA041702');
select * from Owns;
insert into Participated values ('A01','KA052250',11,10000);
insert into Participated values ('A02','KA052250',12,50000);
insert into Participated values ('A03','KA095477',13,25000);
insert into Participated values ('A04','KA053408',14,3000);
insert into Participated values ('A05','KA041702',15,5000);
select * from Participated;
update Participated set damage_amount=25000 where reg_num='KA053408' and report_num='12';
select * from Participated;
select * from Participated;
select count(distinct driver_id)CNT from Participated a,Accident b where a.report_num=b.report_num and b.accident_date like '%08';
insert into Accident values(16,'2008-03-08','Domlur');
select * from Accident;
select accident_date,location from Accident;
select driver_id from Participated where damage_amount>25000;
SELECT * FROM Participated ORDER BY damage_amount DESC;
SELECT AVG(damage_amount) FROM Participated;
delete from Participated where damage_amount<(select avg(damage_amount)from Participated);
SELECT P_Name FROM Person A, Participated B WHERE A.driver_id = B.driver_id AND damage_amount > (SELECT AVG(damage_amount) FROM Participated);
SELECT max(damage_amount) FROM Participated;