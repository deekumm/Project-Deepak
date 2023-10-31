
Create table StudentInfo (
STU_ID INT Primary key, 
STU_NAME varchar(25),
DOB date,
PHONE_NO BIGINT,
EMAIL_ID varchar(200),
Address varchar(300));

CREATE TABLE coursesinfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(255),
    COURSE_INSTRUCTOR_NAME VARCHAR(255));

CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLLMENT_STATUS VARCHAR(20),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES coursesinfo(COURSE_ID));
--inserting value into StudentInfo table
INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, Address)
VALUES
    (1, 'Alice Johnson', '2000-05-15', 1234567890, 'alice@example.com', '123 Main St, City, State, 12345'),
    (2, 'Bob Smith', '1999-08-22', 9876543210, 'bob@example.com', '456 Elm St, Town, State, 54321'),
    (3, 'Charlie Brown', '2001-02-10', 5555555555, 'charlie@example.com', '789 Oak St, Village, State, 98765'),
    (4, 'David Lee', '2000-11-30', 1112223333, 'david@example.com', '321 Pine St, Hamlet, State, 67890'),
    (5, 'Eva Wilson', '1998-04-05', 74598887777, 'eva@example.com', '654 Cedar St, Borough, State, 23456');
--inserting value into CoursesInfo table
INSERT INTO coursesinfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES
    (1, 'Introduction to Programming', 'John Smith'),
    (2, 'Database Management', 'Emily Johnson'),
    (3, 'Web Development Fundamentals', 'Michael Brown'),
    (4, 'Data Analysis with Python', 'Sarah Davis'),
    (5, 'Artificial Intelligence', 'James Wilson');
--inserting value into EnrollmentInfo table
INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLLMENT_STATUS)
VALUES
    (1, 1, 1, 'Enrolled'),
    (2, 1, 2, 'Enrolled'),
    (3, 2, 1, 'Not Enrolled'),
    (4, 3, 3, 'Enrolled'),
    (5, 4, 4, 'Not Enrolled');
--Query to Display name, contact information & Enrollment status
Select StudentInfo.STU_NAME, StudentInfo.PHONE_NO,EnrollmentInfo.course_id, EnrollmentInfo.ENROLLMENT_STATUS
 from StudentInfo 
  JOIN EnrollmentInfo on StudentInfo.STU_ID = EnrollmentInfo.stu_id;
  
--Query to retrieve list of courses in which a specific student enrolled
Select StudentInfo.STU_NAME, CoursesInfo.COURSE_NAME,enrollmentInfo.enrollment_status
from enrollmentInfo
LEFT JOIN studentinfo on StudentInfo.STU_ID = enrollmentInfo.stu_ID
left join coursesinfo on coursesinfo.course_Id= enrollmentInfo.course_Id
    where stu_name='Alice Johnson'; 
	
--Query to retrieve course information including course name and instructor information
Select COURSE_NAME, COURSE_INSTRUCTOR_NAME from CoursesInfo;

--Query to retrieve course information of specific course
Select * from CoursesInfo where COURSE_NAME = 'Database Management';

--Query to retrieve course information for multiple course
Select * from CoursesInfo;

--Query to retrieve number of student enrolled in each course
Select COURSE_NAME, count(*) AS Numbers
    from CoursesInfo
    Group By COURSE_NAME;
	
--Query to retrieve list of students enrolled in specific course
Select StudentInfo.STU_NAME
from StudentInfo
Inner Join EnrollmentInfo on StudentInfo.STU_ID = EnrollmentInfo.stu_ID
Inner Join CoursesInfo on EnrollmentInfo.ENROLLMENT_ID=CoursesInfo.COURSE_ID
Where CoursesInfo.COURSE_NAME = 'Introduction to Programming';

--Query to retrieve the count of enrolled students for each instructors
SELECT COURSE_INSTRUCTOR_NAME,COUNT(*) AS NumberOfStudents
FROM coursesinfo
left join enrollmentinfo on EnrollmentInfo.COURSE_ID = coursesinfo.COURSE_ID
where ENROLLMENT_STATUS ='Enrolled'
GROUP BY COURSE_INSTRUCTOR_NAME;

--Query to retrieve list of students enrolled in multiple courses
SELECT StudentInfo.STU_NAME, COUNT(EnrollmentInfo.COURSE_ID) AS num_of_courses_enrolled
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID
GROUP BY StudentInfo.STU_ID
HAVING COUNT(EnrollmentInfo.COURSE_ID) > 1;

--Query to retrieve course that have highest number of enrolled students
SELECT CoursesInfo.COURSE_ID, CoursesInfo.COURSE_NAME, COUNT(EnrollmentInfo.STU_ID) AS num_of_courses_enrolled
FROM coursesInfo
LEFT JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
GROUP BY CoursesInfo.COURSE_ID, CoursesInfo.COURSE_NAME
ORDER BY num_of_courses_enrolled DESC;



