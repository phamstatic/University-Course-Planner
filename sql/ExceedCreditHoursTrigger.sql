CREATE TRIGGER trgExceedCreditHours
ON atbl_University_Enrollments
AFTER INSERT
AS
BEGIN
    DECLARE @StudentId INT, @Semester NVARCHAR(25), @TotalCredits INT;

    -- Get the StudentId and Semester from the inserted rows
    SELECT @StudentId = StudentId, @Semester = Semester
    FROM inserted;

    -- Calculate the total credits for the student and semester
    SELECT @TotalCredits = SUM(CourseCredits)
    FROM atbl_University_Enrollments ue
    JOIN atbl_University_Courses uc ON ue.CourseId = uc.CourseId
    WHERE ue.StudentId = @StudentId AND ue.Semester = @Semester
    GROUP BY ue.StudentId, ue.Semester;

    -- Check if the total credits exceed the limit
    IF @TotalCredits > 24
    BEGIN
		PRINT N'You cannot exceed 24 credit hours in a semester!';
        ROLLBACK TRANSACTION;
    END
END;

INSERT INTO atbl_University_Enrollments (StudentId, CourseId, Semester, GradeLetter, GradeNumeric)
VALUES ('10000', 'ALOT1234', 'Spring 2024', 'C-', '72');	