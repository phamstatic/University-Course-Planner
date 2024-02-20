CREATE VIEW aviw_University_StudentsExamsAnswers AS

SELECT
	se.StudentId,
	se.Semester,
	se.CourseId,
	se.ExamId,
	seq.QuestionId,
	seq.QuestionOrder,
	seqa.AnswerId,
	seqa.AnswerOrder, -- AnswerOrder is the same value as ChosenAnswer
	eqa.Correct,
	(
    SELECT CAST(COUNT(*) * 100.00 / (SELECT COUNT(*) -- Calculates the total number of questions
                                     FROM atbl_University_ExamsQuestions 
                                     WHERE atbl_University_ExamsQuestions.ExamId = se.ExamId) AS DECIMAL(10, 2))
		FROM atbl_University_StudentsExamsQuestionsAnswers seqa
		INNER JOIN atbl_University_ExamsQuestionsAnswers eqa ON seqa.QuestionId = eqa.QuestionId
			AND seqa.AnswerId = eqa.AnswerId
		INNER JOIN atbl_University_StudentsExamsQuestions seq ON seqa.ExamId = seq.ExamId
			AND seqa.StudentId = seq.StudentId
			AND seqa.Semester = seq.Semester
			AND seqa.QuestionId = seq.QuestionId
		WHERE seqa.StudentId = se.StudentId
			AND seqa.Semester = se.Semester
			AND seqa.ExamId = se.ExamId
			AND eqa.Correct = 1
			AND seqa.AnswerOrder = seq.ChosenAnswer
	) AS ExamGrade,
	eq.Question,
	eqa.Answer

FROM atbl_University_StudentsExams se
INNER JOIN atbl_University_StudentsExamsQuestions seq ON se.ExamId = seq.ExamId 
	AND se.Semester = seq.Semester
INNER JOIN atbl_University_StudentsExamsQuestionsAnswers seqa ON seq.QuestionId = seqa.QuestionId 
	AND seq.ChosenAnswer = seqa.AnswerOrder AND seqa.Semester = se.Semester
INNER JOIN atbl_University_ExamsQuestionsAnswers eqa ON seqa.AnswerId = eqa.AnswerId
INNER JOIN atbl_University_ExamsQuestions eq ON seq.QuestionId = eq.QuestionId
GROUP BY
	se.StudentId,
	se.Semester,
	se.CourseId,
	se.ExamId,
	seq.QuestionId,
	seq.QuestionOrder,
	seqa.AnswerId,
	seqa.AnswerOrder,
	eqa.Correct,
	eq.Question,
	eqa.Answer
