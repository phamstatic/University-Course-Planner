--- Students Tab
-- ="INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('" & B2 & "', '" & C2 & "', '" & TEXT(E2, "YYYY-MM-DD") & "', '" & F2 & "', '" & G2 & "');"
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Tony', 'Ting', '1988-05-16', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Katherine K.', 'Swan', '1978-02-25', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Michael', 'Sullivan', '1980-04-28', 'F', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Elizabeth J.', 'Sullivan', '1952-03-02', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Geraldine T.', 'Spicer', '1966-12-08', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Rolando T.', 'Smith', '1979-08-16', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Peggy R.', 'Smith', '1986-09-10', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Carlos M.', 'Short', '1956-04-04', 'F', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Barbara R.', 'Schultz', '1984-07-31', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Scot', 'Schulte', '1987-06-10', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Steve', 'Schmidt', '1978-01-17', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Raymond', 'Sam', '1979-01-21', 'M', 'PT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Jim', 'Rodman', '1974-12-23', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Carol Ann F.', 'Rockne', '1984-11-20', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Dorothy B.', 'Robinson', '1984-03-29', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Jack S.', 'Richins', '1968-09-17', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Dave', 'Richards', '1983-02-28', 'F', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Betty J.', 'Potts', '1989-01-08', 'F', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Paulo Sergio Da Silva', 'Pinto', '1988-05-16', 'M', 'FT');
INSERT INTO atbl_University_Students (FirstName, LastName, BirthDate, Gender, EnrollmentStatus) VALUES ('Jonathan', 'Perera', '1978-02-25', 'F', 'FT');
--- Student Degree Enrollments Tab
INSERT INTO atbl_University_StudentsDegrees (DegreeId, StudentId, DegreeType) VALUES('Computer Science', 10010, 'Major');
INSERT INTO atbl_University_StudentsDegrees (DegreeId, StudentId, DegreeType) VALUES('Digital Media', 10010, 'Minor');
INSERT INTO atbl_University_StudentsDegrees (DegreeId, StudentId, DegreeType) VALUES('Digital Media', 10011, 'Major');
--- Student Transcripts Tab
-- ="INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('" & A2 & "', '" & B2 & "', '" & C2 & "', '" & TEXT(D2, "YYYY-MM-DD") & "', '" & H2 & "');"
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'CHEM1331', '2021-09-01', '85');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'CHEM2133', '2021-09-01', '65');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'CHEM2133', '2022-01-01', '70');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'CHEM2133', '2022-09-01', '80');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, DropDate, NumericalGrade) VALUES ('Digital Media', '10010', 'CIS3320', '2020-09-01', '2022-09-01', '50');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10010', 'CIS3320', '2022-01-01', '98');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'COSC1336', '2020-09-01', '98');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'COSC1437', '2021-01-01', '97');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'COSC2425', '2021-09-01', '88');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'COSC2436', '2021-09-01', '87');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'COSC3336', '2022-01-01', '78');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'COSC3360', '2022-01-01', '87');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10010', 'DIGM1300', '2020-09-01', '95');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10010', 'DIGM1350', '2021-01-01', '90');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10010', 'DIGM1376', '2021-01-01', '93');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10010', 'ENGL1301', '2020-09-01', '95');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10010', 'ENGL1302', '2021-01-01', '95');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'ENGL2340', '2022-01-01', '80');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'GEOL1102', '2022-01-01', '85');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Computer Science', '10010', 'GEOL1302', '2022-01-01', '85');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'CIS3320', '2022-01-01', '75');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'DIGM1300', '2020-09-01', '80');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'DIGM1350', '2021-01-01', '77');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'DIGM1376', '2021-01-01', '82');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'DIGM2325', '2022-01-01', '93');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'DIGM2351', '2022-09-01', '88');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'DIGM2352', '2022-01-01', '86');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'DIGM2353', '2021-09-01', '87');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'ENGL1301', '2020-09-01', '88');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'ENGL1302', '2021-01-01', '87');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'ENGL2340', '2022-09-01', '78');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'GOVT2305', '2022-09-01', '90');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'GOVT2306', '2021-09-01', '93');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'HDCS1300', '2022-01-01', '95');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'HIST1301', '2020-09-01', '97');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'HIST1302', '2021-09-01', '87');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'MATH1311', '2020-09-01', '88');
INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES ('Digital Media', '10011', 'MATH1313', '2021-01-01', '83');
-- 75 + 80 + 77 + 82 + 93 + 88 + 86 + 87+ 88+87+78+90+93+95+97+87+88+83 )/ 18