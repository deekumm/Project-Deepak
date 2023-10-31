Create database student_database
create table Student_Table(
student_ID int Primary Key,
Stu_name text, 
Department text, 
Email_ID text, 
Phone_no numeric, 
Address text, 
Date_of_birth date, 
Gender text,
Major text,
GPA numeric,
Grade text);
Insert into student_table values 
(201,'Gaurav','CSE','gaur@amazon.com',8973772165,'Bangalore', '06-07-1994','M','CS',7.9,'C'),
(202,'Abha','CSE','abha@amazon.com',9873772165,'Patna', '07-06-1994','F','Physics',8.0,'C'),
(203,'Ram','ECE','ram@amazon.com',6773882165,'Madhurai', '07-06-1994','M','IT',9.3,'A'),
(204,'Raju','EEE','raju@amazon.com',9073723165,'Chandigarh', '07-06-1994','M','Biology',9.7,'A'),
(205,'Shiva','MECH','shiva@amazon.com',6773778165,'Shimla', '07-06-1994','M','Botny',8.1,'B'),
(206,'Manu','ECE','manu@amazon.com',8873232165,'Chennai', '07-06-1994','M','Zoology',8.7,'B'),
(207,'Gaba','IT','gaba@amazon.com',9973777865,'Chennai', '07-06-1994','F','Maths',8.3,'B'),
(208,'Hero','IT','hero@amazon.com',9073723165,'Chennai', '07-06-1994','M','Maths',8.9,'B'),
(209,'Aisha','CIVIL','aisha@amazon.com',9823772165,'Ranchi', '07-06-1994','F','Philosophy',9.5,'A'),
(210,'Anwar','CIVIL','anwar@amazon.com',9973782165,'Kanpur', '07-06-1994','M','History',9.6,'A');
select * from student_table
order by Grade DESC;
Select * from student_table
where gender='M';
select * from student_table
where gpa<5.0;
update student_table set email_id='gunja@amazon.com',grade='E' where stu_name='Raju';
Select stu_name, Age(now(),date_of_birth)as age from student_table where grade='B';
Select department,gender,AVG(gpa) as average_gpa from student_table
group by department,gender;
Alter table student_table rename to student_info;
select stu_name from student_info where gpa=(select max(gpa)from student_info);