CREATE FUNCTION CalculateGrade (
    @StudentId INT,
    @Semester NVARCHAR(14),
    @CourseId NVARCHAR(8),
    @ExamId INT
)
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @TotalQuestions INT;
    DECLARE @CorrectAnswers INT;
    DECLARE @Score DECIMAL(5, 2);

    SET @TotalQuestions = (SELECT COUNT(*) FROM atbl_University_ExamsQuestions WHERE ExamId = @ExamId);

    SELECT @CorrectAnswers = COUNT(*)
	FROM atbl_University_StudentsExamsQuestions eq
	JOIN atbl_University_StudentsExamsQuestionsAnswers seqa ON eq.QuestionId = seqa.QuestionId
	AND eq.ChosenAnswer = seqa.AnswerOrder 
	AND eq.Semester = seqa.Semester
	JOIN atbl_University_ExamsQuestionsAnswers eqa ON seqa.AnswerId = eqa.AnswerId
	WHERE eqa.Correct = 1 AND eq.Semester = @Semester

    IF @TotalQuestions > 0
        SET @Score = CAST((@CorrectAnswers * 100.0) / @TotalQuestions AS DECIMAL(5, 2));
    ELSE
        SET @Score = 0;

    RETURN @Score;
END;
