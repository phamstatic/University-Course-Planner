CREATE TRIGGER trg_MoreThanThreeAttempts
ON atbl_University_StudentsDegreesCourses
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @StudentId INT, @CourseId NVARCHAR(8);
    SELECT @StudentId = StudentId, @CourseId = CourseId FROM inserted;
	IF EXISTS (
		SELECT COUNT(*) 
		FROM atbl_University_StudentsDegreesCourses 
		WHERE StudentId = @StudentId AND CourseId = @CourseId
		HAVING COUNT(*) > 3
	)
    BEGIN
        RAISERROR ('You cannot take the same course more than 3 times!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;