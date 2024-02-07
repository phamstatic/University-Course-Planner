DROP TABLE IF EXISTS atbl_University_Courses;
DROP TABLE IF EXISTS atbl_University_Degrees;
DROP TABLE IF EXISTS atbl_University_StudentsAddresses;
DROP TABLE IF EXISTS atbl_University_StudentsContacts;
DROP TABLE IF EXISTS atbl_University_DegreesCourses;
DROP TABLE IF EXISTS atbl_University_StudentsDegrees;
DROP TABLE IF EXISTS atbl_University_StudentsDegreesCourses;
DROP TABLE IF EXISTS atbl_University_Students;

CREATE TABLE atbl_University_Degrees (
	DegreeId NVARCHAR(256) NOT NULL
);

ALTER TABLE atbl_University_Degrees ADD CONSTRAINT PK_atbl_University_Degrees_DegreeName PRIMARY KEY (DegreeId);

CREATE TABLE atbl_University_Courses (
	CourseId NVARCHAR(8) NOT NULL, 
	CourseName NVARCHAR(256) NOT NULL, 
	CourseCredits SMALLINT NOT NULL, 
	CourseDescription NVARCHAR(MAX)
);

ALTER TABLE atbl_University_Courses ADD CONSTRAINT PK_atbl_University_Courses_CourseId PRIMARY KEY (CourseId);

CREATE TABLE atbl_University_DegreesCourses (
	DegreeId NVARCHAR(256) NOT NULL,
	CourseId NVARCHAR(8) NOT NULL
);

ALTER TABLE atbl_University_DegreesCourses ADD CONSTRAINT FK_atbl_University_DegreesCourses_DegreeId FOREIGN KEY (DegreeId) REFERENCES atbl_University_Degrees (DegreeId);
ALTER TABLE atbl_University_DegreesCourses ADD CONSTRAINT FK_atbl_University_DegreesCourses_CourseId FOREIGN KEY (CourseId) REFERENCES atbl_University_Courses (CourseId);

CREATE TABLE atbl_University_Students (
	StudentId INT IDENTITY(10000, 1),
	FirstName NVARCHAR(25) NOT NULL,
	LastName NVARCHAR(25) NOT NULL,
	BirthDate DATE NOT NULL,
	Gender NVARCHAR(1) NOT NULL CHECK (Gender IN ('M', 'F')),
	EnrollmentStatus NVARCHAR(2) NOT NULL CHECK (EnrollmentStatus IN ('FT', 'PT'))
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
	DegreeId NVARCHAR(256) NOT NULL,
	DegreeType NVARCHAR(25) NOT NULL CHECK (DegreeType IN ('Major', 'Minor'))
);

ALTER TABLE atbl_University_StudentsDegrees ADD CONSTRAINT FK_atbl_University_Degrees_StudentId FOREIGN KEY (StudentId) REFERENCES atbl_University_Students (StudentId);

ALTER TABLE atbl_University_StudentsDegrees ADD CONSTRAINT FK_atbl_University_Degrees_DegreeId FOREIGN KEY (DegreeId) REFERENCES atbl_University_Degrees (DegreeId);

CREATE TABLE atbl_University_StudentsDegreesCourses (
	DegreeId NVARCHAR(256) NOT NULL,
	StudentId INT NOT NULL,
	CourseId NVARCHAR(8) NOT NULL,
	EnrollmentDate DATE DEFAULT '2024-01-01',
	DropDate DATE DEFAULT NULL,
	NumericalGrade SMALLINT NOT NULL,
	LetterGrade NVARCHAR(2),
    Semester AS (
        CASE
            WHEN MONTH(EnrollmentDate) BETWEEN 8 AND 12 THEN 'Fall ' + CAST(YEAR(EnrollmentDate) AS NVARCHAR(4))
            WHEN MONTH(EnrollmentDate) BETWEEN 1 AND 4 THEN 'Spring ' + CAST(YEAR(EnrollmentDate) AS NVARCHAR(4))
            ELSE NULL
        END
    ) PERSISTED,
	CONSTRAINT CannotTakeTheSameClassInASemester UNIQUE (StudentId, CourseId, Semester)
);

ALTER TABLE atbl_University_StudentsDegreesCourses ADD CONSTRAINT FK_atbl_University_StudentsDegreesCourses_DegreeId FOREIGN KEY (DegreeId) REFERENCES atbl_University_Degrees (DegreeId);
ALTER TABLE atbl_University_StudentsDegreesCourses ADD CONSTRAINT FK_University_Students_DegreesCourses_StudentId FOREIGN KEY (StudentId) REFERENCES atbl_University_Students (StudentId);
ALTER TABLE atbl_University_StudentsDegreesCourses ADD CONSTRAINT FK_University_Students_DegreesCourses_CourseId FOREIGN KEY (CourseId) REFERENCES atbl_University_Courses (CourseId);
-------------------------
SELECT * FROM atbl_University_Students;
SELECT * FROM atbl_University_StudentsContacts;
SELECT * FROM atbl_University_StudentsDegrees;
SELECT * FROM atbl_University_StudentsDegreesCourses;
SELECT * FROM atbl_University_Degrees;
SELECT * FROM atbl_University_Courses;