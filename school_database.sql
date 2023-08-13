CREATE TABLE schools (
	school_id integer PRIMARY KEY,
  name varchar(50)
 );
 
CREATE TABLE addresses (
	address_id integer PRIMARY KEY,
  street_number integer,
  street_name varchar(50),
  city varchar(50),
  country varchar(50)
 );
 
 CREATE TABLE students (
   student_id integer PRIMARY KEY,
   first_name varchar(20),
   last_name varchar(20),
   address_id integer REFERENCES addresses(address_id),
   age integer,
   grade integer,
   school_id integer REFERENCES schools(school_id)
 );
 
 CREATE TABLE parents (
   parent_id integer PRIMARY KEY,
   first_name varchar(20),
   last_name varchar(20),
   phone varchar(20),
   email varchar(20),
   address_id integer REFERENCES addresses(address_id)
 );
 
 CREATE TABLE students_parents (
   student_id integer REFERENCES students(student_id),
   parent_id integer REFERENCES parents(parent_id),
   PRIMARY KEY (student_id, parent_id)
 );
 
 CREATE TABLE staff (
   staff_id integer PRIMARY KEY,
   school_id integer REFERENCES schools(school_id),
   position varchar(50),
   work_phone varchar(20),
   salary money,
   start_date date
 );
 
 CREATE TABLE staff_info (
   staff_id integer REFERENCES staff(staff_id) UNIQUE,
   first_name varchar(20),
   last_name varchar(20),
   home_phone varchar(20),
   email varchar(50),
   address_id integer REFERENCES addresses(address_id)
 );

CREATE TABLE courses (
  course_id integer PRIMARY KEY,
  name varchar(50),
  section integer,
  description varchar(300)
);

CREATE TABLE students_courses (
  student_id integer REFERENCES students(student_id),
  course_id integer REFERENCES courses(course_id),
  PRIMARY KEY (student_id, course_id)
);

CREATE TABLE courses_staff (
  course_id integer REFERENCES courses(course_id),
  staff_id integer REFERENCES staff(staff_id),
  PRIMARY KEY (course_id, staff_id),
  section integer
);

INSERT INTO schools
VALUES (1, 'Mission Hill'), (2, 'Collingwood');

INSERT INTO addresses
VALUES (1, 345, 'Learning Street', 'Vancouver', 'Canada'), (2, 314, 'Wisdom Avenue', 'Edmonton', 'Canada'),
(3, 8254, 'Granola Crescent', 'Vancouver', 'Canada'), (4, 6903, 'Almond Street', 'Edmonton', 'Canada'),
(5, 1299, 'Squirrel Place', 'Vancouver', 'Canada'), (6, 264, 'Peanut Place', 'Edmonton', 'Canada');

INSERT INTO students
VALUES (1, 'John', 'Little', 3, 12, 6, 1), (2, 'Sam', 'Small', 4, 11, 5, 1), (3, 'Tim', 'Tiny', 5, 10, 4, 1),
(4, 'Lewis', 'Little', 3, 14, 8, 1), (5, 'Gregory', 'Gregarious', 5, 13, 8, 1), (6, 'Barry', 'Barnyard', 5, 14, 8, 1);

INSERT INTO parents
VALUES (1, 'Jane', 'Little', '236-865-2992', 'janelittle43@gmail.com', 3), (2, 'Larry', 'Little', '236-853-0078', 'janelittle43@gmail.com', 3),
(3, 'Ben', 'Bucko', '821-222-2322', 'bbucko@shaw.ca', 4), (4, 'Sally', 'Sweet', '987-666-2310', 'generous.sally@gmail.com', 5);

INSERT INTO staff
VALUES (1, 1, 'Principal', '250-888-9911', 120000.00, '1994-08-14'), (2, 1, 'Teacher', '250-888-9920', 80000.00, '2015-08-28'),
(3, 1, 'Teacher', '250-888-9920', 53503.55, '2022-10-15'), (4, 1, 'Teacher', '250-888-9920', 76580.00, '2020-09-01');

INSERT INTO staff_info
VALUES (1, 'Big', 'Cheese', '465-332-2984', 'bigAngryMan@shaw.ca', 4), (2, 'Jan', 'Lenno', '565-332-9833', 'jlanno55@gmail.com', 4),
(3, 'Frank', 'Newton', '777-555-4444', 'fnewton@hotmail.com', 6), (4, 'Matthew', 'Mango', '637-444-9382', 'mangostastegreat@gmail.com', 6);

INSERT INTO courses
VALUES (1, 'Math8', 'Blah Blah Fractions, Pythagoras and stuff'), (2, 'P.E.8', 'Run around and stuff'), (3, 'Reading7', 'Focus on the fundamentals of reading quickly'),
(4, 'Math7', 'Something to do with negative numbers...probably');

INSERT INTO students_parents
VALUES (1, 1), (1, 2), (2, 3), (3, 4), (4, 3), (5, 4), (6, 4);

INSERT INTO students_courses
VALUES (1, 4), (4, 2), (5, 2), (6, 2), (5, 1), (4, 1), (6, 3);

INSERT INTO courses_staff
VALUES (1, 2), (2, 3), (3, 3), (4, 2), (2, 2);

