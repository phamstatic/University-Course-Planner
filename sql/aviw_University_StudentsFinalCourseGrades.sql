CREATE VIEW aviw_University_StudentsFinalCourseGrades AS

SELECT
    StudentId, 
    Semester, 
    CourseId,
    CourseCredits,
	Grade,
    CASE
        WHEN Grade >= 95 THEN 'A'
        WHEN Grade >= 94 AND Grade >= 85 THEN 'A-'
        WHEN Grade >= 84 AND Grade >= 80 THEN 'B'
        WHEN Grade >= 79 AND Grade >= 75 THEN 'B-'
        WHEN Grade >= 74 AND Grade >= 70 THEN 'C'
        ELSE 'F'
    END AS LetterGrade
FROM (
    SELECT
        scg.StudentId, 
        scg.Semester, 
        scg.CourseId,
		c.CourseCredits,
        SUM(scg.GradeWeight * scg.ExamGrade) / 8 AS Grade
    FROM
        aviw_University_StudentsCoursesGrades scg
	INNER JOIN 
		atbl_University_Courses c ON scg.CourseId = c.CourseId
	GROUP BY 
        scg.StudentId, 
        scg.Semester, 
        scg.CourseId,
		c.CourseCredits
) AS Grades;
