CREATE VIEW aviw_University_StudentsExams AS
SELECT
    sa.StudentId,
    sa.Semester,
    se.CourseId,
    CAST(sa.ExamId AS NVARCHAR(256)) + '. ' + ex.ExamDescription AS Exam,
    CAST(sa.QuestionOrder AS NVARCHAR(256)) + '. ' + eq.Question AS Question,
    CASE
        WHEN sa.AnswerID IS NULL THEN NULL
        ELSE (
            SELECT eqa.Answer FROM atbl_University_ExamsQuestionsAnswers eqa
            WHERE eqa.AnswerId = sa.AnswerId
        )
    END AS Answer,
    CASE 
        WHEN sa.AnswerId IS NULL THEN NULL
        ELSE (
            SELECT eqa.Correct FROM atbl_University_ExamsQuestionsAnswers eqa
            WHERE eqa.AnswerId = sa.AnswerId
        )
    END AS Correct,
    dbo.CalculateGrade(sa.StudentId, sa.Semester, se.CourseId, sa.ExamId) AS ExamGrade
FROM
    atbl_University_StudentsExamsQuestions sa
JOIN 
    atbl_University_StudentsExams se ON sa.StudentId = se.StudentId AND sa.ExamId = se.ExamId AND sa.Semester = se.Semester
JOIN 
    atbl_University_ExamsQuestions eq ON sa.QuestionId = eq.QuestionId
JOIN 
    atbl_University_Exams ex ON eq.ExamId = ex.ExamId;