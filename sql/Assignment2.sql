DROP TABLE IF EXISTS atbl_University_Courses;
DROP TABLE IF EXISTS atbl_University_Degrees;
DROP TABLE IF EXISTS atbl_University_DegreesCourses;
DROP TABLE IF EXISTS atbl_University_Students;
DROP TABLE IF EXISTS atbl_University_StudentsAddresses;
DROP TABLE IF EXISTS atbl_University_StudentsContacts;
DROP TABLE IF EXISTS atbl_University_StudentsDegrees;
DROP TABLE IF EXISTS atbl_University_StudentsDegreesCourses;

CREATE TABLE atbl_University_Degrees (
	DegreeName NVARCHAR(256) NOT NULL
);

ALTER TABLE atbl_University_Degrees ADD CONSTRAINT PK_atbl_University_Degrees_DegreeName PRIMARY KEY (DegreeName);

CREATE TABLE atbl_University_Courses (
	CourseId NVARCHAR(8) NOT NULL, 
	CourseName NVARCHAR(256) NOT NULL, 
	CourseCredits SMALLINT NOT NULL, 
	CourseDescription NVARCHAR(MAX)
);

ALTER TABLE atbl_University_Courses ADD CONSTRAINT PK_atbl_University_Courses_CourseId PRIMARY KEY (CourseId);

CREATE TABLE atbl_University_DegreesCourses (
	DegreeName NVARCHAR(256) NOT NULL,
	CourseId NVARCHAR(8) NOT NULL
);

ALTER TABLE atbl_University_DegreesCourses ADD CONSTRAINT FK_atbl_University_DegreesCourses_DegreeName FOREIGN KEY (DegreeName) REFERENCES atbl_University_Degrees (DegreeName);
ALTER TABLE atbl_University_DegreesCourses ADD CONSTRAINT FK_atbl_University_DegreesCourses_CourseId FOREIGN KEY (CourseId) REFERENCES atbl_University_Courses (CourseId);

CREATE TABLE atbl_University_Students (
	StudentId INT IDENTITY(10000, 1),
	BirthDate DATE NOT NULL,
	FirstName NVARCHAR(25) NOT NULL,
	LastName NVARCHAR(25) NOT NULL,
	IsFullTime BIT NOT NULL
);

ALTER TABLE atbl_University_Students ADD CONSTRAINT PK_atbl_University_Students_StudentId PRIMARY KEY (StudentId);

CREATE TABLE atbl_University_StudentsContacts (
	StudentId INT,
	PhoneNumber VARCHAR(15) NOT NULL,
	PersonalEmail NVARCHAR(50) NOT NULL,
	AddressStreet NVARCHAR(25) NOT NULL,
	AddressCity NVARCHAR(25) NOT NULL,
	AddressState NVARCHAR(25) NOT NULL,
	AddressZipcode NVARCHAR(25) NOT NULL
);

ALTER TABLE atbl_University_StudentsContacts ADD CONSTRAINT FK_atbl_University_StudentsContacts_StudentId FOREIGN KEY (StudentId) REFERENCES atbl_University_Students (StudentId);

CREATE TABLE atbl_University_StudentsDegrees (
	StudentId INT,
	DegreeName NVARCHAR(256) NOT NULL,
	IsMajor BIT NOT NULL
);

ALTER TABLE atbl_University_StudentsDegrees ADD CONSTRAINT FK_atbl_University_Degrees_StudentId FOREIGN KEY (StudentId) REFERENCES atbl_University_Students (StudentId);

CREATE TABLE atbl_University_StudentsDegreesCourses (
	StudentId INT NOT NULL,
	CourseId NVARCHAR(8) NOT NULL,
	NumericalGrade SMALLINT NOT NULL,
	LetterGrade NVARCHAR(2),
	Semester NVARCHAR(256) NOT NULL,
	CONSTRAINT CannotTakeTheSameClassInASemester UNIQUE (StudentId, CourseId, Semester)
);

ALTER TABLE atbl_University_StudentsDegreesCourses ADD CONSTRAINT FK_University_Students_DegreesCourses_StudentId FOREIGN KEY (StudentId) REFERENCES atbl_University_Students (StudentId);
ALTER TABLE atbl_University_StudentsDegreesCourses ADD CONSTRAINT FK_University_Students_DegreesCourses_CourseId FOREIGN KEY (CourseId) REFERENCES atbl_University_Courses (CourseId);

INSERT INTO atbl_University_StudentsDegreesCourses (StudentId, CourseId, NumericalGrade, Semester)
VALUES (10000, 'MATH2414', 70, 'Fall 2020');

SELECT * FROM atbl_University_StudentsDegreesCourses;
-------------------------
INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('COSC1336', 'Computer Science Programming', 3, 'Introduction to problem solving through computer programming. Students will learn the fundamental principles of computer science, basic hardware and software components of a computer system, computational thinking, basic algorithms, and programming concepts. Students will get hands-on experience in problem solving by designing, writing, testing and debugging programs in a modern programming language.');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('COSC1437', 'Introduction to Programming', 3,
'Fundamental concepts of structured programming; procedures and elementary data structures with a focus on problem solving strategies and implementation; computer organization, structured procedural programming, C/C++ programming language, and algorithm design.');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('COSC2436', 'Programming and Data Structures', 4, 'Introduction to fundamental data structures: arrays, lists, stacks, queues, hash tables, trees; sorting and searching; graph algorithms; design, analysis, and comparison of algorithms. Correctness verification techniques such as assertions and invariants. Review program specification, unit testing, and debugging.');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('MATH2413', 'Calculus I', 4, 'Calculus of rational functions, limits, derivatives, applications of the derivative, antiderivatives, the definite integral with applications, mean value theorem, fundamental theorem of calculus, and numerical integration.');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('MATH2414', 'Calculus II', 4, 'Calculus of transcendental functions: additional techniques and applications of integration, indeterminate forms, improper integrals, Taylor’s formula, and infinite series.');
-------------------------
DECLARE @StudentId INT; 

INSERT INTO atbl_University_Degrees (DegreeName) SELECT 'Computer Science';
INSERT INTO atbl_University_Degrees (DegreeName) SELECT 'Computer Engineering';
INSERT INTO atbl_University_Degrees (DegreeName) SELECT 'Computer Information Systems';
INSERT INTO atbl_University_Degrees (DegreeName) SELECT 'Mathematics';

INSERT INTO atbl_University_Students(BirthDate, FirstName, LastName, IsFullTime) 
VALUES ('2001-12-11', 'John', 'Pham', 1);

SET @StudentId = SCOPE_IDENTITY();

INSERT INTO atbl_University_StudentsContacts (StudentId, PhoneNumber, PersonalEmail, AddressStreet, AddressCity, AddressState, AddressZipcode)
VALUES(@StudentId, '281-123-1234', 'john.pham@omega365.com', 'Eldridge Parkway', 'Houston', 'Texas', '77777');

INSERT INTO atbl_University_StudentsDegrees (StudentId, DegreeName, IsMajor) 
VALUES (@StudentId, 'Computer Science', 1);

INSERT INTO atbl_University_StudentsDegrees (StudentId, DegreeName, IsMajor) 
VALUES (@StudentId, 'Mathematics', 0);

INSERT INTO atbl_University_StudentsDegreesCourses (StudentId, CourseId, NumericalGrade, LetterGrade, Semester)
VALUES (@StudentId, 'COSC1336', 32, 'F', 'Spring 2024');

SELECT * FROM atbl_University_Students;
SELECT * FROM atbl_University_StudentsContacts;
SELECT * FROM atbl_University_StudentsDegrees;
SELECT * FROM atbl_University_StudentsDegreesCourses;
SELECT * FROM atbl_University_Degrees;
SELECT * FROM atbl_University_Courses;