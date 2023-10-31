create database EventsManagement;
create table Events (
Event_Id INT Primary Key,
Event_name text,
Event_date date,
Event_location text,
Event_description text);
create table Attendees(
Attendee_Id INT Primary Key,
Attendee_name text,
Attendee_Phone NUMERIC,
Attendee_email text,
Attendee_city text);
Create table Registrations(
Registration_Id INT Primary Key,
Event_ID INT,
Attendee_Id INT,
Registration_date date,
Registration_amount numeric,
FOREIGN Key(Event_Id) references events(event_Id),
FOREIGN Key(Registration_Id) references Registrations(Registration_Id));


insert into events values 
(101,'Moonlight','2022-11-12','Bilaspur','Once in a lifetime'),
(102,'Jio','2022-11-13','Jammu','Jio Dhan Dhanadhan'),
(103,'Verasity','2022-11-14','Lahore','Vampire university'),
(104,'Zukebox','2022-11-15','Madurai','Box in a tempo'),
(105,'RJ Raveena','2022-11-16','Trichy','Raveena Kareena and Tareena');

--Inserting values into attendees table

insert into Attendees values (601,'Krishna','8973772165','Krishna@amazon.com','Tripura'),
(602,'Abha','9876543211','abha@amazon.com','Delhi'),
(603,'Rahul','9600652234','rahul@amazon.com','Mumbai'),
(604,'Yash','9988776655','yash@amazon.com','Madurai'),
(605,'Saba','8899007766','saba@amazon.com','Kashmir');

--Inserting values into Registrations table

insert into registrations values (901,101,601,'2022-10-10','9000'),
(902,102,602,'2022-10-11','11200'),
(903,103,603,'2022-10-12','71200'),
(904,104,604,'2022-11-13','7500'),
(905,105,605,'2022-10-13','14230');
insert into events (Event_id,Event_name,Event_date,Event_location,Event_description) values 
('106','Rickash','2022-11-18','Kohlapur','Dil Jahan aur aap');
Update events set event_name='Titan Tornado' where Event_id='104';
delete from registrations where Event_id='104';
delete from events where Event_id='104';

Insert into attendees (Attendee_id,Attendee_name,Attendee_phone,Attendee_email,Attendee_city) values 
(606,'koyla','147563892','koyla@amazon.com','mysore');
insert into registrations (Registration_id,Event_id,Attendee_id,Registration_date,Registration_amount) values 
(906,105,006,'2022-12-05','40000');
Select * from events;
Select attendee_name from attendees;
select events.event_name,count(registrations.attendee_Id)as No_of_attendees
from registrations
left join events on events.event_Id= registrations.event_id
group by 1;
