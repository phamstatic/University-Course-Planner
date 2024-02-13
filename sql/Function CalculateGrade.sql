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
    FROM atbl_University_StudentsExamsQuestions sea
    JOIN atbl_University_ExamsQuestionsAnswers eqa ON sea.QuestionId = eqa.QuestionId AND sea.AnswerId = eqa.AnswerId
    WHERE sea.StudentId = @StudentId AND sea.ExamId = @ExamId AND eqa.Correct = 1 AND Semester = @Semester;

    IF @TotalQuestions > 0
        SET @Score = CAST((@CorrectAnswers * 100.0) / @TotalQuestions AS DECIMAL(5, 2));
    ELSE
        SET @Score = 0;

    RETURN @Score;
END;
GO