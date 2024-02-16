CREATE VIEW aviw_University_StudentsExams AS

SELECT
	se.StudentId,
	se.Semester,
	se.CourseId,
	se.ExamId,
	seq.QuestionId,
	seq.QuestionOrder,
	seqa.AnswerId,
	seqa.AnswerOrder, -- AnswerOrder is the same value as ChosenAnswer
	dbo.CalculateGrade(se.StudentId, se.Semester, se.CourseId, se.ExamId) AS ExamGrade,
	eqa.Correct
FROM atbl_University_StudentsExams se
INNER JOIN atbl_University_StudentsExamsQuestions seq ON se.ExamId = seq.ExamId AND se.Semester = seq.Semester
INNER JOIN atbl_University_StudentsExamsQuestionsAnswers seqa ON seq.QuestionId = seqa.QuestionId AND seq.ChosenAnswer = seqa.AnswerOrder AND seqa.Semester = se.Semester
INNER JOIN atbl_University_ExamsQuestionsAnswers eqa ON seqa.AnswerId = eqa.AnswerId
GROUP BY
	se.StudentId,
	se.Semester,
	se.CourseId,
	se.ExamId,
	seq.QuestionId,
	seq.QuestionOrder,
	seqa.AnswerId,
	seqa.AnswerOrder,
	eqa.Correct