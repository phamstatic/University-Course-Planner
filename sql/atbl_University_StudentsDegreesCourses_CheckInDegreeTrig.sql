CREATE TRIGGER atbl_University_StudentsDegreesCourses_CheckInDegreeTrig
ON atbl_University_StudentsDegreesCourses
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StudentId INT;
    DECLARE @DegreeId NVARCHAR(256);
    DECLARE @CourseId NVARCHAR(8);

    SELECT @StudentId = StudentId, @DegreeId = DegreeId, @CourseId = CourseId
    FROM inserted;

    IF NOT EXISTS (
        SELECT 1
        FROM atbl_University_StudentsDegrees sd
        WHERE sd.StudentId = @StudentId
        AND sd.DegreeId = @DegreeId
    )
    BEGIN
        RAISERROR ('The student is not enrolled in the specified degree.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    IF NOT EXISTS (
        SELECT 1
        FROM atbl_University_DegreesCourses dc
        WHERE dc.DegreeId = @DegreeId
        AND dc.CourseId = @CourseId
    )
    BEGIN
        RAISERROR ('The course is not in the degree plan.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;