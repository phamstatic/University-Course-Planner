SET IDENTITY_INSERT atbl_University_Students ON;  
INSERT INTO atbl_University_Students (StudentId, FirstName, LastName, BirthDate, Gender, EnrollmentStatus) 
VALUES (20000, 'John', 'Pham', '2001-12-11', 'M', 'FT');
SET IDENTITY_INSERT atbl_University_Students OFF;  

INSERT INTO atbl_University_StudentsDegrees (StudentId, DegreeId, DegreeType)
VALUES (20000, 'Computer Science', 'Major');

INSERT INTO atbl_University_StudentsDegrees (StudentId, DegreeId, DegreeType)
VALUES (20000, 'Digital Media', 'Minor');

INSERT INTO atbl_University_StudentsDegreesCourses (DegreeId, StudentId, CourseId, EnrollmentDate, NumericalGrade) VALUES
('Computer Science', 20000, 'COSC1336', '2024-1-08', 20)

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Spring 2024',
@CourseId = 'COSC1336',
@ExamId = 1;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 1;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 2;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 2
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 3;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 4
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 4;

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Spring 2024',
@CourseId = 'COSC1336',
@ExamId = 2;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 2 AND QuestionOrder = 1;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 2 AND QuestionOrder = 2;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 2 AND QuestionOrder = 3;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 2 AND QuestionOrder = 4;

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Spring 2024',
@CourseId = 'COSC1336',
@ExamId = 3;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 3 AND QuestionOrder = 1;

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Spring 2024',
@CourseId = 'COSC1336',
@ExamId = 4;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 4 AND QuestionOrder = 1;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 4 AND QuestionOrder = 2;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 4 AND QuestionOrder = 3;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 4 AND QuestionOrder = 4;

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Spring 2024',
@CourseId = 'COSC1336',
@ExamId = 5;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 5 AND QuestionOrder = 1;
---
EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Fall 2024',
@CourseId = 'COSC1336',
@ExamId = 1;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 1;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 2;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 2
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 3;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 4
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 4;

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Fall 2024',
@CourseId = 'COSC1336',
@ExamId = 2;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 2 AND QuestionOrder = 1;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 2 AND QuestionOrder = 2;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 2 AND QuestionOrder = 3;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 2 AND QuestionOrder = 4;

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Fall 2024',
@CourseId = 'COSC1336',
@ExamId = 3;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 3 AND QuestionOrder = 1;

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Fall 2024',
@CourseId = 'COSC1336',
@ExamId = 4;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 4 AND QuestionOrder = 1;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 4 AND QuestionOrder = 2;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 4 AND QuestionOrder = 3;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 4 AND QuestionOrder = 4;

EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science',
@Semester = 'Fall 2024',
@CourseId = 'COSC1336',
@ExamId = 5;
UPDATE atbl_University_StudentsExamsQuestions SET ChosenAnswer = 1
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 5 AND QuestionOrder = 1;
--
SELECT * FROM atbl_University_ExamsQuestionsAnswers
SELECT * FROM atbl_University_StudentsExamsQuestions
SELECT * FROM atbl_University_ExamsQuestions

SELECT * FROM atbl_University_StudentsExamsQuestionsAnswers