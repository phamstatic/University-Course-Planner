DROP TABLE IF EXISTS atbl_University_Students;
DROP TABLE IF EXISTS atbl_University_Contacts;
DROP TABLE IF EXISTS atbl_University_Education;
DROP TABLE IF EXISTS atbl_University_Semesters;
DROP TABLE IF EXISTS atbl_University_Enrollments;
DROP TABLE IF EXISTS atbl_University_Courses;

CREATE TABLE atbl_University_Students (
  StudentId INT PRIMARY KEY IDENTITY(10000, 1),
  BirthDate DATE,
  FirstName NVARCHAR(25),
  MiddleName NVARCHAR(25),
  LastName NVARCHAR(25)
);

CREATE TABLE atbl_University_Contacts (
	StudentId INT,
	PhoneNumber VARCHAR(15),
	PersonalEmail NVARCHAR(50),
	AddressStreet NVARCHAR(25),
	AddressCity NVARCHAR(25),
	AddressState NVARCHAR(25),
	AddressZipcode NVARCHAR(25),
	FOREIGN KEY (StudentId) REFERENCES atbl_University_Students(StudentId)
);

CREATE TABLE atbl_University_Education (
	StudentId INT,
	YearEnrolled DATE,
	GraduationDate DATE,
	DegreeMajor NVARCHAR(25),
	DegreeMinor NVARCHAR(25),
	FOREIGN KEY (StudentId) REFERENCES atbl_University_Students(StudentId)
);

CREATE TABLE atbl_University_Semesters (
	StudentId INT,
	Semester NVARCHAR(25) PRIMARY KEY,
	SemesterCredits SMALLINT,
	FOREIGN KEY (StudentId) REFERENCES atbl_University_Students(StudentId)
);

CREATE TABLE atbl_University_Courses (
	CourseId NVARCHAR(8) PRIMARY KEY,
	CourseName NVARCHAR(50),
	CourseCredits SMALLINT,
	CoursePrerequisites NVARCHAR(MAX),
	CourseDescription NVARCHAR(MAX)
);

CREATE TABLE atbl_University_Enrollments (
	StudentId INT,
	CourseId NVARCHAR(8),
	Semester NVARCHAR(25),
	GradeLetter NVARCHAR(2),
	GradeNumeric SMALLINT,
	FOREIGN KEY (StudentId) REFERENCES atbl_University_Students(StudentId),
	FOREIGN KEY (Semester) REFERENCES atbl_University_Semesters(Semester)
); 