SET IDENTITY_INSERT atbl_University_Students ON;  
INSERT INTO atbl_University_Students (StudentId, FirstName, LastName, BirthDate, Gender, EnrollmentStatus) 
VALUES (20000, 'John', 'Pham', '2001-12-11', 'M', 'FT');
SET IDENTITY_INSERT atbl_University_Students OFF;  

INSERT INTO atbl_University_StudentsDegrees (StudentId, DegreeId, DegreeType)
VALUES (20000, 'Computer Science', 'Major');

INSERT INTO atbl_University_StudentsDegrees (StudentId, DegreeId, DegreeType)
VALUES (20000, 'Digital Media', 'Minor');

INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES
('Computer Science', 20000, 'COSC1336', '2024-1-08', 20),
('Computer Science', 20000, 'COSC1336', '2024-08-08', 85);
