CREATE TABLE STUDENTS (STD_ID INT(5), STD_NAME VARCHAR(20), DOB DATE, DOJ DATE, FEE INT(5),GENDER CHAR);
DESC STUDENTS;
INSERT INTO STUDENTS VALUES( '1','PRAGATHI Y RAJ','2005-10-10','2024-6-23',25000,'F');
INSERT INTO STUDENTS VALUES( '2','KHUSHI H N','2005-3-12','2024-6-23',25000,'F');
INSERT INTO STUDENTS VALUES( '2','DIVYASHREE B L','2005-12-7','2024-6-23',25000,'F');
select * FROM STUDENTS;
ALTER TABLE STUDENTS ADD PHONE_NO INT(10);
select * FROM STUDENTS
ALTER TABLE STUDENTS 
RENAME COLUMN PHONE_NO TO STUDENT_NO;
select * FROM STUDENTS
ALTER TABLE STUDENTS RENAME TO STUDENTS_INFO;
SELECT * FROM STUDENTS_INFO;