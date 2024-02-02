DECLARE @StudentId INT;

-- John
INSERT INTO atbl_University_Students(BirthDate, FirstName, MiddleName, LastName)
VALUES('2001-12-11', 'John', 'Tam', 'Pham');

SET @StudentId = SCOPE_IDENTITY();

INSERT INTO atbl_University_Contacts (StudentId, PhoneNumber, PersonalEmail, AddressStreet, AddressCity, AddressState, AddressZipcode)
VALUES(@StudentId, '281-123-1234', 'john.pham@omega365.com', 'Eldridge Parkway', 'Houston', 'Texas', '77777');

INSERT INTO atbl_University_Education (StudentId, YearEnrolled, GraduationDate, DegreeMajor, DegreeMinor)
VALUES(@StudentId, '2020-08-01', '2024-05-01', 'Computer Science', 'Mathematics');

INSERT INTO atbl_University_Semesters (StudentId, Semester, SemesterCredits)
VALUES (@StudentId, 'Spring 2024', 0);

INSERT INTO atbl_University_Enrollments (StudentId, CourseId, Semester, GradeLetter, GradeNumeric)
VALUES (@StudentId, 'ENGL1301', 'Spring 2024', 'A', '100');

INSERT INTO atbl_University_Enrollments (StudentId, CourseId, Semester, GradeLetter, GradeNumeric)
VALUES (@StudentId, 'MATH2413', 'Spring 2024', 'B-', '77');

INSERT INTO atbl_University_Enrollments (StudentId, CourseId, Semester, GradeLetter, GradeNumeric)
VALUES (@StudentId, 'COSC1336', 'Spring 2024', 'F', '32');	

INSERT INTO atbl_University_Enrollments (StudentId, CourseId, Semester, GradeLetter, GradeNumeric)
VALUES (@StudentId, 'COSC1336', 'Spring 2024', 'C-', '72');	

UPDATE atbl_University_Semesters
SET SemesterCredits = (
    SELECT SUM(uc.CourseCredits)
    FROM atbl_University_Enrollments ue
    JOIN atbl_University_Courses uc ON ue.CourseId = uc.CourseId
    WHERE ue.Semester = atbl_University_Semesters.Semester
    AND ue.StudentId = atbl_University_Semesters.StudentId
    GROUP BY ue.StudentId, ue.Semester
);

SELECT * FROM atbl_University_Students;
SELECT * FROM atbl_University_Contacts;
SELECT * FROM atbl_University_Education;
SELECT * FROM atbl_University_Semesters;
SELECT * FROM atbl_University_Enrollments;