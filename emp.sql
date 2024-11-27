use newdatabase;
create table Project(P_no int,P_loc varchar(30),P_name varchar(30),primary key(P_no));
create table Department(Dept_no int,D_name varchar(30),D_loc varchar(30),primary key(Dept_no));
create table Employee(Emp_no int,E_name varchar(30),Mgr_no int,Hiredate date,Sal int,Dept_no int,primary key(Emp_no),foreign key(Dept_no)references Department(Dept_no));
create table Assign_to(Emp_no int,P_no int,Job_role varchar(30),primary key(Emp_no,P_no),foreign key(Emp_no)references Employee(Emp_no),foreign key(P_no)references Project(P_no));
create table Incentives(Emp_no int,Incentive_date date,Incentive_amount int,primary key(Emp_no,Incentive_date),foreign key(Emp_no)references Employee(Emp_no));
insert into Project values(1,'Banglore','Water cycle');
insert into Project values(2,'Mysore','E commerce');
insert into Project values(3,'Hyderbad','Stock inventory');
insert into Project values(4,'Banglore','Bank');
insert into Project values(5,'Hassan','Portofolio');
insert into Project values(6,'Hyderbad','Travel');
insert into Project values(7,'Banglore','Restaurant');
insert into Department values(101,'HR','Pune');
insert into Department values(102,'Acounts','Banglore');
insert into Department values(103,'Production','Mysuru');
insert into Department values(104,'Operations','Kolkata');
insert into Department values(105,'Design','Banglore');
insert into Department values(106,'Purchasing','Manglore');
insert into Employee values(201,'Pragathi',2091,'2024-10-10',50000,101);
insert into Employee values(202,'Divya',2091,'2012-01-20',50000,102);
insert into Employee values(203,'Khushi',2932,'2024-04-21',70000,103);
insert into Employee values(204,'Asha',2272,'2020-05-10',25000,104);
insert into Employee values(205,'Thrisha',2002,'2023-07-11',30000,104);
insert into Employee values(206,'Srusti',2345,'2013-03-15',40000,105);
insert into Assign_to values(201,1,'CEO');
insert into Assign_to values(202,2,'Product Manager');
insert into Assign_to values(203,3,'President');
insert into Assign_to values(202,3,'President');
insert into Assign_to values(204,4,'Vice-president');
insert into Assign_to values(205,5,'Assistant');
insert into Assign_to values(206,6,'Finance-manger');
insert into Incentives values(201,'2024-10-29',10000);
insert into Incentives values(202,'2024-09-29',5000);
insert into Incentives values(203,'2022-08-09',10000);
insert into Incentives values(204,'2014-10-19',0);
insert into Incentives values(205,'2022-04-17',500);
insert into Incentives values(206,'2014-05-27',1000);
select Emp_no from Incentives where Incentive_amount=0;
select * from Assign_to;
select A.Emp_no from Assign_to as A where P_no in (select P.P_no from Project as P where P_loc in ("Banglore","Hyderbad","Mysuru"));
select E.Emp_no,E.E_name,D.D_name,A.Job_role,D.D_loc,P.P_loc 
from Employee as E,Department as D,Project as P,Assign_to as A 
where E.Dept_no=D.Dept_no and E.Emp_no=A.Emp_no and A.P_no=P.P_no and D.D_loc=P.P_loc;
