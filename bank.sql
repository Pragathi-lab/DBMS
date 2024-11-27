use newdatabase;
create table Branch(branch_name varchar(30),branch_city varchar(30),assests real,primary key(branch_name)); 
desc Branch;
create table Bank_Account(acc_no int, branch_name varchar(30),balance real,primary key(acc_no),foreign key(branch_name) references Branch(branch_name));
desc Bank_Account;
create table Bank_Customers(customer_name varchar(30),customer_street varchar(30),customer_city varchar(30),primary key(customer_name));
desc Bank_Customers;
create table Depositers(customer_name varchar(30),acc_no int,primary key(customer_name,acc_no),foreign key(customer_name)references Bank_Customers(customer_name),foreign key(acc_no) references Bank_Account(acc_no));
desc Depositer;
create table Loan(loan_no int,branch_name varchar(30),amount real,primary key(loan_no),foreign key(branch_name)references Branch(branch_name));
desc Loan;
insert into Branch values('SBI-Chamrajpet','Banglore',50000);
insert into Branch values('SBI-Residency','Banglore',10000);
insert into Branch values('SBI-ShivajiRoad','Bombay',20000);
insert into Branch values('SBI-ParlimentRoad','Delhi',10000);
insert into Branch values('SBI-Jantarmantar','Delhi',20000);
select * from Branch;
insert into Bank_Account values(1,'SBI-Chamrajpet',2000);
insert into Bank_Account values(2,'SBI-Residency',5000);
insert into Bank_Account values(3,'SBI-ShivajiRoad',6000);
insert into Bank_Account values(4,'SBI-ParlimentRoad',9000);
insert into Bank_Account values(5,'SBI-Jantarmantar',8000);
insert into Bank_Account values(6,'SBI-ShivajiRoad',4000);
insert into Bank_Account values(8,'SBI-Residency',4000);
insert into Bank_Account values(9,'SBI-ParlimentRoad',3000);
insert into Bank_Account values(10,'SBI-Residency',5000);
insert into Bank_Account values(11,'SBI-Jantarmantar',2000);
select * from Bank_Account;
insert into Bank_Customers values('Avinash','Bull_Temple_Road','Banglore');
insert into Bank_Customers values('Dinesh','Bannergatta_Road','Banglore');
insert into Bank_Customers values('Mohan','NationalCollege_Road','Banglore');
insert into Bank_Customers values('Nikil','Akbar_Road','Delhi');
insert into Bank_Customers values('Ravi','Prithviraj_Road','Delhi');
select * from Bank_Customers;
insert into Depositers values('Avinash',1);
insert into Depositers values('Dinesh',2);
insert into Depositers values('Nikil',4);
insert into Depositers values('Ravi',5);
insert into Depositers values('Avinash',8);
insert into Depositers values('Nikil',9);
insert into Depositers values('Dinesh',10);
insert into Depositers values('Nikil',11);
select * from Depositers;
insert into Loan values(1,'SBI-Chamrajpet',1000);
insert into Loan values(2,'SBI-Residency',2000);
insert into Loan values(3,'SBI-ShivajiRoad',3000);
insert into Loan values(4,'SBI-ParlimentRoad',4000);
insert into Loan values(5,'SBI-Jantarmantar',5000);
select * from Loan;
SELECT * FROM Loan ORDER BY amount DESC;
select branch_name, (assests/100000) as 'assests in lakhs' from Branch;
select d.customer_name,ba.branch_name,count(ba.acc_no)as amount_count from Depositers d  join Bank_Account ba on d.acc_no=ba.acc_no group by d.customer_name,ba.branch_name having count(ba.acc_no)>=2;
create view BranchLoanSummary as 
select branch_name,sum(amount)as
total_loan_amount from loan group by branch_name;
select * from BranchLoanSummary;
 SELECT * FROM Loan ORDER BY amount DESC;
select d.customer_name from Depositers d
join Bank_Account ba on d.acc_no=ba.acc_no
join Branch b on ba.branch_name=b.branch_name
where b.branch_city='Delhi'
group by d.customer_name
having count(Distinct b.branch_name)=(select count(Distinct branch_name)from Branch where branch_city='Delhi');
(SELECT customer_name FROM Depositers ) UNION (SELECT customer_name FROM BORROWER);
UPDATE Bank_Account SET balance=balance *1.05;
select * from Bank_Account;
select branch_name from Branch where assests > all (select assests from Branch where branch_city ='Banglore');
delete  from Bank_Account
where branch_name IN (select branch_name from Branch where branch_city='Bombay');
select * from Bank_Account;
select distinct S.customer_name from Depositers as S 
where not exists ( (select branch_name 
 			    from Branch 
			    where branch_city ='Delhi') except 
			(select R.branch_name 
			from Depositers as T, Bank_Account as R 
			where T.acc_no = R.acc_no 
			and S.customer_name = T.customer_name ));
update Branch set assests=9000 where branch_name='SBI-ShivajiRoad' and branch_city='Bombay';
