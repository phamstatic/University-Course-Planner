CREATE VIEW aviw_University_StudentsFinalCourseGrades AS

SELECT
	scg.StudentId, 
	scg.Semester, 
	scg.CourseId,
	SUM(scg.GradeWeight * scg.ExamGrade) / 8 AS Grade
FROM
	aviw_University_StudentsCoursesGrades scg
GROUP BY 
	scg.StudentId, 
	scg.Semester, 
	scg.CourseId