CREATE PROCEDURE StudentExam
    @StudentID INT,
    @DegreeID NVARCHAR(256),
	@Semester NVARCHAR(14),
    @CourseID NVARCHAR(8),
    @ExamID INT
AS
BEGIN
    INSERT INTO atbl_University_StudentsExams (StudentID, DegreeID, Semester, CourseID, ExamID)
    VALUES (@StudentID, @DegreeID, @Semester, @CourseID, @ExamID);
END;
GO