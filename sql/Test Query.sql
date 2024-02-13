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

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Spring 2024',
@CourseId = 'COSC1336',
@ExamId = 1

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Fall 2024',
@CourseId = 'COSC1336',
@ExamId = 1

EXEC StudentExamGrade
@StudentId = 20000,
@Semester ='Spring 2024',
@CourseId = 'COSC1336',
@ExamId = 1

EXEC StudentExamGrade
@StudentId = 20000,
@Semester ='Spring 2024',
@CourseId = 'COSC1336',
@ExamId = 1

UPDATE atbl_University_StudentsExamsQuestions SET AnswerId = 4
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 1;
UPDATE atbl_University_StudentsExamsQuestions SET AnswerId = 6
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 2;
UPDATE atbl_University_StudentsExamsQuestions SET AnswerId = 10
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 3;
UPDATE atbl_University_StudentsExamsQuestions SET AnswerId = 13
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 4;


UPDATE atbl_University_StudentsExamsQuestions SET AnswerId = 3
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 1;
UPDATE atbl_University_StudentsExamsQuestions SET AnswerId = 5
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 2;
UPDATE atbl_University_StudentsExamsQuestions SET AnswerId = 10
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 3;
UPDATE atbl_University_StudentsExamsQuestions SET AnswerId = 14
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 4;

SELECT * FROM atbl_University_ExamsQuestionsAnswers
SELECT * FROM atbl_University_StudentsExamsQuestions