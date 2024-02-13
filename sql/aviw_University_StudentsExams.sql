CREATE VIEW aviw_University_StudentsExams AS

SELECT
	se.StudentId,
	se.Semester,
	se.CourseId,
	se.ExamId,
	seq.QuestionId,
	CAST(seq.QuestionOrder AS NVARCHAR(256)) + '. ' + eq.Question AS OrderAndQuestion,
	seq.ChosenAnswer,
    CASE
        WHEN seq.ChosenAnswer IS NULL THEN NULL
        ELSE (
            SELECT (CAST(seqa.AnswerId AS NVARCHAR(256)) + '. ' + eq.Question)
            FROM atbl_University_StudentsExamsQuestionsAnswers seqa
            WHERE 
                seqa.AnswerOrder = seq.ChosenAnswer AND
                seqa.StudentId = se.StudentId AND
                seqa.Semester = se.Semester AND
                seqa.ExamId = se.ExamId AND
                seqa.QuestionId = seq.QuestionId
        )
    END AS AnswerId,
	dbo.CalculateGrade(se.StudentId, se.Semester, se.CourseId, se.ExamId) AS ExamGrade

	FROM atbl_University_StudentsExams se
		INNER JOIN atbl_University_StudentsExamsQuestions seq ON se.ExamId = seq.ExamId AND se.Semester = seq.Semester
		INNER JOIN atbl_University_ExamsQuestions eq ON seq.QuestionId = eq.QuestionId
	ORDER BY
		StudentId, Semester, OrderAndQuestion