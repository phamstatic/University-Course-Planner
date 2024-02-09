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
@ExamId = 1;


EXEC StudentExam
@StudentId = 20000,
@DegreeId = 'Computer Science', 
@Semester = 'Fall 2024',
@CourseId = 'COSC1336', 
@ExamId = 1;

DELETE FROM atbl_University_StudentsExamsAnswers WHERE StudentId = 20000;
INSERT INTO atbl_University_StudentsExamsAnswers (StudentId, Semester, ExamId, QuestionId, AnswerId) VALUES
(20000, 'Spring 2024', 1, 1, 4),
(20000, 'Spring 2024', 1, 2, 2),
(20000, 'Fall 2024', 1, 1, 4),
(20000, 'Fall 2024', 1, 2, 6)

EXEC StudentExamGrade
@StudentId = 20000,
@Semester = 'Spring 2024',
@CourseId = 'COSC1336',
@ExamId = 1;

EXEC StudentExamGrade
@StudentId = 20000,
@Semester = 'Fall 2024',
@CourseId = 'COSC1336',
@ExamId = 1;


SELECT * FROM atbl_University_StudentsExams;
SELECT * FROM atbl_University_StudentsExamsAnswers;
/*
SELECT 
	se.StudentId, 
	s.FirstName + ' ' + s.LastName AS FullName,
	se.DegreeId, 
	se.CourseId, 
	se.Semester, 
	e.ExamId, 
	e.ExamDescription, 
	eq.QuestionId, 
	eq.Question, 
	sea.AnswerId, 
	eqa.Answer
FROM atbl_University_StudentsExams se
JOIN atbl_University_Students s ON se.StudentId = s.StudentId
JOIN atbl_University_Exams e ON se.ExamId = e.ExamId
JOIN atbl_University_ExamsQuestions eq ON e.ExamId = eq.ExamId
JOIN atbl_University_StudentsExamsAnswers sea ON eq.QuestionId = sea.QuestionId
JOIN atbl_University_ExamsQuestionsAnswers eqa ON sea.AnswerId = eqa.AnswerId
WHERE se.Semester = sea.Semester
ORDER BY 
    CASE 
        WHEN se.Semester LIKE 'Spring%' THEN 1 
        WHEN se.Semester LIKE 'Fall%' THEN 2 
    END, 
    se.Semester;
*/
