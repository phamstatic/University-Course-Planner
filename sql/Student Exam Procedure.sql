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

    INSERT INTO @RandomizedQuestions (QuestionId, RandomOrder)
    SELECT QuestionId, NEWID() AS RandomOrder
    FROM atbl_University_ExamsQuestions
    WHERE ExamId = @ExamID;

    INSERT INTO atbl_University_StudentsExams (StudentID, DegreeID, Semester, CourseID, ExamID)
    VALUES (@StudentID, @DegreeID, @Semester, @CourseID, @ExamID);

    INSERT INTO atbl_University_StudentsExamsQuestions (StudentID, Semester, ExamID, QuestionId, AnswerId, QuestionOrder)
    SELECT @StudentID, @Semester, @ExamID, rq.QuestionId, NULL, ROW_NUMBER() OVER (ORDER BY rq.RandomOrder)
    FROM @RandomizedQuestions rq;
END;
