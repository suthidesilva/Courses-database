CREATE TABLE Yotes (
  YoteId INTEGER,
  FirstName TEXT,
  LastName TEXT,
  Email TEXT 
);
INSERT INTO Yotes VALUES (0000000, 'Ahmad', 'Hammoud', 'ahamd@yotes.collegeofidaho.edu') , (0000001, 'Suthi', 'de Silva', 'suthi@yotes.collegeofidaho.edu');

 CREATE TABLE Instructors (
  InsructorId INTEGER,
  FirstName TEXT,
  LastName TEXT,
  Email TEXT 
);
INSERT INTO Instructors VALUES (00000, 'Jonny', 'Comes', 'jcomes@yotes.collegeofidaho.edu') , (00008, 'Robin', 'Cruz', 'rcruz@yotes.collegeofidaho.edu');
INSERT INTO Instructors VALUES (00001, 'Dave', 'Rosoff', 'drosoff.collegeofidaho.edu') , (00003, 'Megan', 'Null', 'mnull@yotes.collegeofidaho.edu'),(00004, 'Jena', 'Lea Meinecke', 'jleameinecke@yotes.collegeofidaho.edu'),(00005, 'Cara', 'Laney', 'claney@yotes.collegeofidaho.edu'),(00006, ' Elizabeth', 'J. Wakeman', 'ewakeman@yotes.collegeofidaho.edu');
   
CREATE TABLE CourseDetails (
  CourseSubject VARCHAR,
  CourseNumber INTEGER,
  CourseTitle TEXT,
  CourseDescription TEXT, 
  Credits INTEGER
);

INSERT INTO CourseDetails VALUES ('CSC', 270, 'Applied Databases', 'An introduction to the fundamental concepts of database design and management. Topics may include entity-relationship and relational data models, normalization, relational database design and implementation, SQL, and administration.', 3) , ('CSC', 235, 'Programming Languages', 'An examination of the principles of programming language design, together with tools and techniques of implementation. Specific instances of several families of languages are investigated, together with theoretical considerations; these families may include object-oriented, functional, array-based, and data-flow languages.', 3) , ('MAT', 212, 'Multiple Regression Analysis', 'An introduction to statistical modeling and methods. Topics may include model construction and analysis using multiple linear regression, analysis of variance, and logistic regression. The course makes substantial use of statistical software. Students who have taken more than one calculus course should generally take MAT-212 rather than MAT-125.', 3) , ('PHY', 100, 'The Universe', 'This course focuses on the development of the science of astronomy through the use of observations, theories, and models. Topics may include astronomical instruments, the night sky, the solar system, stars and galaxies, or cosmology.', 3) , ('PSY', 407, 'Legal Psychology', 'This course will address issues related to intersections of psychology and the law. Topics to be covered will include: interrogations and confessions, eyewitness memory, forensics, juries, definitions of insanity and competence, conviction and incarceration of the mentally ill, race and justice, and the death penalty. Students will be expected to read and understand advanced texts, including primary source materials.', 3) , ('PHI', 307, 'Social Philosophy', 'A critical examination of social institutions and constructions from a perspective of values. Topics may include: family, race, gender identity, criminality and health.', 3);

CREATE TABLE Courses (
  CourseId INTEGER,
  CourseSubject VARCHAR,
  CourseNumber INTEGER,
  "Section" INTEGER,
  "Year" YEAR,
  Term VARCHAR,
  InstructorId INTEGER
);

INSERT INTO Courses VALUES (000, 'CSC', 270, 1, 2023,'Spring',0000) , (001, 'CSC', 235, 1, 2023,'Spring',0001);
INSERT INTO Courses VALUES (003, 'MAT', 212, 1, 2023,'Spring',0003) , (004, 'PHY', 100, 1, 2023,'Spring',0004) , (005, 'PSY', 407, 1, 2023,'Spring',0005) , (006, 'PHI', 307, 1, 2023,'Spring',0006);
INSERT INTO Courses VALUES (000, 'CSC', 270, 1, 2022,'Spring',00000) , (000, 'CSC', 270, 1, 2021,'Spring',00008);

CREATE TABLE CourseMeetings (
  CourseMeetingId INTEGER,
  CourseId INTEGER,
  Days VARCHAR,
  StartTime TIME,
  EndTime TIME,
  Location VARCHAR
);

INSERT INTO CourseMeetings VALUES (00, 000, 'TTh','09:25:00', '10:40:00' ,'Boone 132') , (01, 001, 'MWF', '11:00:00', '11:50:00' ,'CML 105');

INSERT INTO CourseMeetings VALUES (03, 003, 'MWF','13:00:00', '13:50:00' ,'Boone 132') , (04, 004, 'TTh', '12:15:00', '13:30:00' ,'Boone 124') , (05, 005, 'MWF','08:00:00', '08:50:00' ,'CML 208') , (06, 006, 'TTh', '08:00:00', '09:15:00' ,'Strahorn 315');

DELETE FROM Yotes WHERE FirstName = "Robin";

CREATE TABLE CourseStudent (
  CourseId INTEGER,
  StudentId INTEGER
);

INSERT INTO CourseStudent  VALUES (000, 0000000) , (001, 0000001);
INSERT INTO CourseStudent  VALUES (003, 0000000) , (004, 0000000) , (005, 0000001) , (006, 0000001) , (000, 0000001) ,(001, 0000000);

SELECT * FROM Yotes;
SELECT * FROM Instructors;
SELECT * FROM CourseDetails;
SELECT * FROM Courses;
SELECT * FROM CourseMeetings;
SELECT * FROM CourseStudent;
.schema

SELECT C.CourseSubject ||'-'|| C.CourseNumber ||'-'||  C."Section" AS "Course", CD.CourseTitle AS "Course Title" , I.LastName AS "Instructor" , CM.Days , CM.StartTime AS "Start Time" , CM.EndTime AS "End Time" , CM.Location AS "room"
  
FROM CourseStudent AS CS
JOIN CourseMeetings AS CM ON CM.CourseId = CS.CourseId
JOIN Yotes AS Y ON Y.YoteId = CS.StudentId
JOIN Courses AS C ON C.CourseId = CS.CourseId
JOIN CourseDetails AS CD ON CD.CourseNumber = C.CourseNumber
JOIN Instructors AS I ON I.InsructorId = C.InstructorId
  
WHERE Y.FirstName = "Ahmad" AND Y.LastName = "Hammoud" AND C.Term = "Spring" AND C."Year" = 2023
;


.mode list;
SELECT DISTINCT I.FirstName ||' '|| I.LastName AS "Instructor Full Name"
  
FROM Courses AS C
JOIN Instructors AS I ON I.InsructorId = C.InstructorId
  
WHERE C.CourseSubject = "CSC" AND CourseNumber = "270";

typo in I,InsructorId

.schema


CREATE TABLE Yotes2 (
  YoteId INTEGER PRIMARY KEY,
  FirstName TEXT,
  LastName TEXT,
  Email TEXT UNIQUE NOT NULL 
);

INSERT INTO Yotes2 VALUES (0000000, 'Ahmad', 'Hammoud', 'ahamd@yotes.collegeofidaho.edu') , (0000001, 'Suthi', 'de Silva', 'suthi@yotes.collegeofidaho.edu');

DROP TABLE IF EXISTS Yotes;
ALTER TABLE Yotes2 RENAME TO Yotes;
SELECT * FROM Yotes;


CREATE TABLE CourseStudent2 (
  CourseId INTEGER REFERENCES Courses(CourseId) ON DELETE CASCADE ON UPDATE CASCADE,
  StudentId INTEGER REFERENCES Yotes(YoteId) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (CourseId , StudentId)
);

INSERT INTO CourseStudent2 VALUES (000, 0000000) , (001, 0000001);
INSERT INTO CourseStudent2 VALUES (003, 0000000) , (004, 0000000) , (005, 0000001) , (006, 0000001) , (000, 0000001) ,(001, 0000000);

DROP TABLE IF EXISTS CourseStudent;
ALTER TABLE CourseStudent2 RENAME TO CourseStudent;

SELECT * FROM CourseStudent ;
.schema

 CREATE TABLE Instructors2 (
  InsructorId INTEGER PRIMARY KEY,
  FirstName TEXT,
  LastName TEXT,
  Email TEXT 
);
INSERT INTO Instructors2 VALUES (00000, 'Jonny', 'Comes', 'jcomes@yotes.collegeofidaho.edu') , (00008, 'Robin', 'Cruz', 'rcruz@yotes.collegeofidaho.edu');
INSERT INTO Instructors2 VALUES (00001, 'Dave', 'Rosoff', 'drosoff.collegeofidaho.edu') , (00003, 'Megan', 'Null', 'mnull@yotes.collegeofidaho.edu'),(00004, 'Jena', 'Lea Meinecke', 'jleameinecke@yotes.collegeofidaho.edu'),(00005, 'Cara', 'Laney', 'claney@yotes.collegeofidaho.edu'),(00006, ' Elizabeth', 'J. Wakeman', 'ewakeman@yotes.collegeofidaho.edu');

DROP TABLE IF EXISTS Instructors;
ALTER TABLE Instructors2 RENAME TO Instructors;


CREATE TABLE CourseDetails2 (
  CourseSubject VARCHAR NOT NULL,
  CourseNumber INTEGER,
  CourseTitle TEXT NOT NULL,
  CourseDescription TEXT, 
  Credits INTEGER CHECK (Credits BETWEEN 0 AND 4),
  PRIMARY KEY (CourseSubject , CourseNumber) 

);

INSERT INTO CourseDetails2 VALUES ('CSC', 270, 'Applied Databases', 'An introduction to the fundamental concepts of database design and management. Topics may include entity-relationship and relational data models, normalization, relational database design and implementation, SQL, and administration.', 3) , ('CSC', 235, 'Programming Languages', 'An examination of the principles of programming language design, together with tools and techniques of implementation. Specific instances of several families of languages are investigated, together with theoretical considerations; these families may include object-oriented, functional, array-based, and data-flow languages.', 3) , ('MAT', 212, 'Multiple Regression Analysis', 'An introduction to statistical modeling and methods. Topics may include model construction and analysis using multiple linear regression, analysis of variance, and logistic regression. The course makes substantial use of statistical software. Students who have taken more than one calculus course should generally take MAT-212 rather than MAT-125.', 3) , ('PHY', 100, 'The Universe', 'This course focuses on the development of the science of astronomy through the use of observations, theories, and models. Topics may include astronomical instruments, the night sky, the solar system, stars and galaxies, or cosmology.', 3) , ('PSY', 407, 'Legal Psychology', 'This course will address issues related to intersections of psychology and the law. Topics to be covered will include: interrogations and confessions, eyewitness memory, forensics, juries, definitions of insanity and competence, conviction and incarceration of the mentally ill, race and justice, and the death penalty. Students will be expected to read and understand advanced texts, including primary source materials.', 3) , ('PHI', 307, 'Social Philosophy', 'A critical examination of social institutions and constructions from a perspective of values. Topics may include: family, race, gender identity, criminality and health.', 3);

DROP TABLE IF EXISTS CourseDetails;
ALTER TABLE CourseDetails2 RENAME TO CourseDetails;

CREATE TABLE Courses2 (
  CourseId INTEGER PRIMARY KEY,
  CourseSubject VARCHAR,
  CourseNumber INTEGER,
  "Section" INTEGER DEFAULT 1,
  "Year" YEAR,
  Term VARCHAR CHECK (Term IN ("Fall","Winter","Spring","Summer")),
  InstructorId INTEGER REFERENCES Yotes(YoteId) ON DELETE SET NULL,
  FOREIGN KEY (CourseSubject, CourseNumber) REFERENCES CourseDetails (CourseSubject, CourseNumber) ON DELETE CASCADE
);
 
INSERT INTO Courses2 VALUES (000, 'CSC', 270, 1, 2023,'Spring',0000) , (001, 'CSC', 235, 1, 2023,'Spring',0001);
INSERT INTO Courses2 VALUES (003, 'MAT', 212, 1, 2023,'Spring',0003) , (004, 'PHY', 100, 1, 2023,'Spring',0004) , (005, 'PSY', 407, 1, 2023,'Spring',0005) , (006, 'PHI', 307, 1, 2023,'Spring',0006);
INSERT INTO Courses VALUES (007, 'CSC', 270, 1, 2022,'Spring',00007) , (008, 'CSC', 270, 1, 2021,'Spring',00008);

DROP TABLE IF EXISTS Courses;
ALTER TABLE Courses2 RENAME TO Courses;
SELECT * FROM Courses;
SELECT * FROM CourseMeetings;

CREATE TABLE CourseMeetings2 (
  CourseMeetingId INTEGER PRIMARY KEY,
  CourseId INTEGER REFERENCES Courses(CourseId) ON DELETE CASCADE ON UPDATE CASCADE,
  Days VARCHAR,
  StartTime TIME,
  EndTime TIME,
  Location VARCHAR,
 CHECK (EndTime > StartTime)
);

INSERT INTO CourseMeetings2 VALUES (00, 000, 'TTh','09:25:00', '10:40:00' ,'Boone 132') , (01, 001, 'MWF', '11:00:00', '11:50:00' ,'CML 105'),(03, 003, 'MWF','13:00:00', '13:50:00' ,'Boone 132') , (04, 004, 'TTh', '12:15:00', '13:30:00' ,'Boone 124') , (05, 005, 'MWF','08:00:00', '08:50:00' ,'CML 208') , (06, 006, 'TTh', '08:00:00', '09:15:00' ,'Strahorn 315');

DROP TABLE IF EXISTS CourseMeetings;
ALTER TABLE CourseMeetings2 RENAME TO CourseMeetings;

CREATE TABLE Yotes2 (
  YoteId INTEGER PRIMARY KEY,
  FirstName TEXT,
  LastName TEXT,
  Email TEXT 
);
INSERT INTO Yotes2 VALUES (0000000, 'Ahmad', 'Hammoud', 'ahamd@yotes.collegeofidaho.edu') , (0000001, 'Suthi', 'de Silva', 'suthi@yotes.collegeofidaho.edu');

DROP TABLE IF EXISTS Yotes;
ALTER TABLE Yotes2 RENAME TO Yotes;

PRAGMA foreign_keys = ON ;

.schema
