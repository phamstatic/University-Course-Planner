CREATE PROCEDURE StudentExam
    @StudentID INT,
    @DegreeID NVARCHAR(256),
	@Semester NVARCHAR(14),
    @CourseID NVARCHAR(8),
    @ExamID INT
AS
BEGIN

    DECLARE @RandomizedQuestions TABLE (
        QuestionId INT,
        RandomOrder UNIQUEIDENTIFIER
    );

	DECLARE @RandomizedAnswers TABLE (
		QuestionId INT,
		AnswerId INT,
		RandomOrder UNIQUEIDENTIFIER
    );

    INSERT INTO @RandomizedQuestions (QuestionId, RandomOrder)
    SELECT QuestionId, NEWID() AS RandomOrder
    FROM atbl_University_ExamsQuestions
    WHERE ExamId = @ExamID;

	INSERT INTO @RandomizedAnswers (QuestionId, AnswerId, RandomOrder)
    SELECT q.QuestionId, a.AnswerId, NEWID() AS RandomOrder
    FROM atbl_University_ExamsQuestions q
    INNER JOIN atbl_University_ExamsQuestionsAnswers a ON q.QuestionId = a.QuestionId
    WHERE q.ExamId = @ExamID;

    INSERT INTO atbl_University_StudentsExams (StudentID, DegreeID, Semester, CourseID, ExamID)
    VALUES (@StudentID, @DegreeID, @Semester, @CourseID, @ExamID);

    INSERT INTO atbl_University_StudentsExamsQuestions (StudentID, Semester, ExamID, QuestionId, AnswerId, QuestionOrder, ChosenAnswer)
    SELECT @StudentID, @Semester, @ExamID, rq.QuestionId, NULL, ROW_NUMBER() OVER (ORDER BY rq.RandomOrder), NULL
    FROM @RandomizedQuestions rq;

    INSERT INTO atbl_University_StudentsExamsQuestionsAnswers (StudentId, QuestionId, Semester, ExamId, AnswerId, AnswerOrder)
    SELECT @StudentId, ra.QuestionId, @Semester, @ExamId, ra.AnswerId, ROW_NUMBER() OVER (PARTITION BY ra.QuestionId ORDER BY ra.RandomOrder)
    FROM @RandomizedAnswers ra;

END;
