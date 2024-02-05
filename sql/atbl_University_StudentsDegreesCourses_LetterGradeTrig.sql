CREATE TRIGGER atbl_University_StudentsDegreesCourses_LetterGradeTrig
ON atbl_University_StudentsDegreesCourses
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @NumericalGrade SMALLINT, @StudentId INT, @CourseId NVARCHAR(8), @Semester NVARCHAR(256);
	SELECT @NumericalGrade = NumericalGrade, @StudentId = StudentId, @CourseId = CourseId, @Semester = Semester FROM inserted; 
	UPDATE atbl_University_StudentsDegreesCourses 
	SET LetterGrade = CASE
	WHEN @NumericalGrade >= 95 THEN 'A' 
	WHEN @NumericalGrade <= 94 AND @NumericalGrade >= 85 THEN 'A-'
	WHEN @NumericalGrade <= 84 AND @NumericalGrade >= 80 THEN 'B'
	WHEN @NumericalGrade <= 79 AND @NumericalGrade >= 75 THEN 'B-'
	WHEN @NumericalGrade <= 74 AND @NumericalGrade >= 70 THEN 'C'
	ELSE 'F' 
	END
	WHERE StudentId = @StudentId AND CourseId = @CourseId AND Semester = @Semester
END;