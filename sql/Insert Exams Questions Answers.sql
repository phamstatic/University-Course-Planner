DROP TABLE IF EXISTS atbl_University_Exams;
DROP TABLE IF EXISTS atbl_University_ExamsQuestionsAnswers;
DROP TABLE IF EXISTS atbl_University_ExamsQuestions;
DROP TABLE IF EXISTS atbl_University_ExamsQuestionsAnswers;
DROP TABLE IF EXISTS atbl_University_StudentsExams;
DROP TABLE IF EXISTS atbl_University_StudentsExamsAnswers;

CREATE TABLE atbl_University_Exams (
	ExamId INT IDENTITY (1, 1),
	CourseId NVARCHAR(8) NOT NULL,
	GradeWeight TINYINT NOT NULL CHECK (GradeWeight IN (1, 2, 3)),
	ExamType AS (
		CASE
			WHEN GradeWeight = 1 THEN 'Quiz'
			WHEN GradeWeight = 2 THEN 'Midterm'
			WHEN GradeWeight = 3 THEN 'Final'
		END
	),
	ExamDescription NVARCHAR(255)
);

ALTER TABLE atbl_University_Exams ADD CONSTRAINT PK_atbl_University_Exams_ExamId PRIMARY KEY (ExamId);

ALTER TABLE atbl_University_Exams ADD CONSTRAINT FK_atbl_University_Exams_CourseId FOREIGN KEY (CourseId) REFERENCES atbl_University_Courses (CourseId);

CREATE TABLE atbl_University_ExamsQuestions (
	ExamId INT,
	QuestionId INT IDENTITY (1, 1),
	Question NVARCHAR(MAX)
);

ALTER TABLE atbl_University_ExamsQuestions ADD CONSTRAINT PK_atbl_University_ExamsQuestions_QuestionId PRIMARY KEY (QuestionId);

ALTER TABLE atbl_University_ExamsQuestions ADD CONSTRAINT FK_atbl_University_ExamsQuestions_ExamId FOREIGN KEY (ExamId) REFERENCES atbl_University_Exams (ExamId);

CREATE TABLE atbl_University_ExamsQuestionsAnswers (
	QuestionId INT NOT NULL,
	AnswerId INT IDENTITY (1, 1),
	Correct BIT NOT NULL,
	Answer NVARCHAR(MAX) NOT NULL,
);

ALTER TABLE atbl_University_ExamsQuestionsAnswers ADD CONSTRAINT FK_atbl_University_ExamsQuestionsAnswers_QuestionId FOREIGN KEY (QuestionId) REFERENCES atbl_University_ExamsQuestions (QuestionId);

ALTER TABLE atbl_University_ExamsQuestionsAnswers ADD CONSTRAINT PK_atbl_University_ExamsQuestionsAnswers_AnswerId PRIMARY KEY (AnswerId);

CREATE UNIQUE INDEX atbl_University_ExamsQuestionsAnswers_UniqueIndex 
ON atbl_University_ExamsQuestionsAnswers (QuestionId) 
WHERE Correct = 1;

CREATE TABLE atbl_University_StudentsExams (
	StudentId INT NOT NULL,
	DegreeId NVARCHAR(256) NOT NULL,
	CourseId NVARCHAR(8) NOT NULL,
	Semester NVARCHAR(14) NOT NULL,
	ExamId INT NOT NULL,
	Score DECIMAL(5, 2),
);

ALTER TABLE atbl_University_StudentsExams ADD CONSTRAINT FK_atbl_University_StudentsExams_StudentId FOREIGN KEY (StudentId) REFERENCES atbl_University_Students (StudentId);

ALTER TABLE atbl_University_StudentsExams ADD CONSTRAINT FK_atbl_University_StudentsExams_DegreeId FOREIGN KEY (DegreeId) REFERENCES atbl_University_Degrees(DegreeId);

ALTER TABLE atbl_University_StudentsExams ADD CONSTRAINT FK_atbl_University_StudentsExams_CourseId FOREIGN KEY (CourseId) REFERENCES atbl_University_Courses(CourseId);

ALTER TABLE atbl_University_StudentsExams ADD CONSTRAINT FK_atbl_University_StudentsExams_ExamId FOREIGN KEY (ExamId) REFERENCES atbl_University_Exams(ExamId);

CREATE TABLE atbl_University_StudentsExamsAnswers (
	StudentId INT NOT NULL,
	Semester NVARCHAR(14) NOT NULL,
	ExamId INT NOT NULL,
	QuestionId INT NOT NULL,
	QuestionOrder INT,
	AnswerId INT
);

ALTER TABLE atbl_University_StudentsExamsAnswers ADD CONSTRAINT FK_atbl_University_StudentsExamsAnswers_ExamId FOREIGN KEY (ExamId) REFERENCES atbl_University_Exams (ExamId);

ALTER TABLE atbl_University_StudentsExamsAnswers ADD CONSTRAINT FK_atbl_University_StudentsExamsAnswers_StudentId FOREIGN KEY (StudentId) REFERENCES atbl_University_Students (StudentId);

ALTER TABLE atbl_University_StudentsExamsAnswers ADD CONSTRAINT FK_atbl_University_StudentsExamsAnswers_QuestionId FOREIGN KEY (QuestionId) REFERENCES atbl_University_ExamsQuestions (QuestionId);

ALTER TABLE atbl_University_StudentsExamsAnswers ADD CONSTRAINT FK_atbl_University_StudentsExamsAnswers_AnswerId FOREIGN KEY (AnswerId) REFERENCES atbl_University_ExamsQuestionsAnswers (AnswerId);

---------

INSERT INTO atbl_University_Exams (CourseId, GradeWeight, ExamDescription)
VALUES ('COSC1336', 1, 'Python Introduction Quiz')

INSERT INTO atbl_University_ExamsQuestions (ExamId, Question) VALUES
(1, 'How do you print "Hello World!" in Python?'),
(1, 'Does Python require a semicolon to end a statement?'),
(1, 'What file type is a Python script?'),
(1, 'What is the correct way to create a function in Python?')

INSERT INTO atbl_University_ExamsQuestionsAnswers (QuestionId, Correct, Answer) VALUES 
(1, 0, 'console.log("Hello World!")'),
(1, 0, 'std::cout << "Hello World!" << std::endl;'),
(1, 0, 'System.out.println("Hello World!");'),
(1, 1, 'print("Hello World!")'),
(2, 0, 'Yes'),
(2, 1, 'No'),
(3, 0, '.cpp'),
(3, 0, '.js'),
(3, 0, '.html'),
(3, 1, '.py'),
(4, 0, 'function()'),
(4, 0, 'create function()'),
(4, 1, 'def function()'),
(4, 0, 'const function()')

SELECT * FROM atbl_University_Students;
SELECT * FROM atbl_University_StudentsExams;
SELECT * FROM atbl_University_StudentsExamsAnswers;
SELECT * FROM atbl_University_Exams;
SELECT * FROM atbl_University_ExamsQuestions;
SELECT * FROM atbl_University_ExamsQuestionsAnswers;

/*
SELECT e.ExamId, eq.QuestionId, eq.Question, ea.AnswerId, ea.Answer
FROM atbl_University_Exams e
JOIN atbl_University_ExamsQuestions eq ON e.ExamId = eq.ExamId
JOIN atbl_University_ExamsQuestionsAnswers ea ON eq.QuestionId = ea.QuestionId
ORDER BY e.ExamId, eq.QuestionId, ea.AnswerId;

SELECT * FROM atbl_University_StudentsDegreesCourses
*/

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

UPDATE atbl_University_StudentsExamsAnswers SET AnswerId = 1
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 1;
UPDATE atbl_University_StudentsExamsAnswers SET AnswerId = 6
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 2;
UPDATE atbl_University_StudentsExamsAnswers SET AnswerId = 13
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 3;
UPDATE atbl_University_StudentsExamsAnswers SET AnswerId = 10
WHERE StudentId = 20000 AND Semester = 'Spring 2024' AND ExamId = 1 AND QuestionOrder = 4;


UPDATE atbl_University_StudentsExamsAnswers SET AnswerId = 3
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 1;
UPDATE atbl_University_StudentsExamsAnswers SET AnswerId = 5
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 2;
UPDATE atbl_University_StudentsExamsAnswers SET AnswerId = 10
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 3;
UPDATE atbl_University_StudentsExamsAnswers SET AnswerId = 14
WHERE StudentId = 20000 AND Semester = 'Fall 2024' AND ExamId = 1 AND QuestionOrder = 4;


SELECT * FROM atbl_University_StudentsExamsAnswers

SELECT * FROM atbl_University_ExamsQuestions
WHERE ExamId = 1

SELECT * FROM atbl_University_ExamsQuestionsAnswers