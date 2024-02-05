CREATE TRIGGER atbl_University_StudentsDegreesCourses_FullTimeTrig
ON atbl_University_StudentsDegreesCourses
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @StudentId INT, @CourseId NVARCHAR(8), @Semester NVARCHAR(256), @CourseCredits SMALLINT;
    SELECT @StudentId = StudentId, @CourseId = CourseId, @Semester = Semester FROM inserted;
	SELECT @CourseCredits = CourseCredits FROM atbl_University_Courses WHERE CourseId = @CourseId;

	DECLARE @EnrollmentStatus NVARCHAR(2);
	SELECT @EnrollmentStatus = EnrollmentStatus FROM atbl_University_Students
	WHERE StudentId = @StudentId;

	IF EXISTS (
		SELECT SUM(atbl_University_Courses.CourseCredits)
		FROM atbl_University_Courses
		INNER JOIN atbl_University_StudentsDegreesCourses ON atbl_University_Courses.CourseId = atbl_University_StudentsDegreesCourses.CourseId
		WHERE atbl_University_StudentsDegreesCourses.Semester = @Semester AND atbl_University_StudentsDegreesCourses.StudentId = @StudentId
		HAVING SUM(atbl_University_Courses.CourseCredits) > 24 AND @EnrollmentStatus = 'FT'
	)
    BEGIN
        RAISERROR ('An FT student cannot take more than 24 hours in a semester!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;