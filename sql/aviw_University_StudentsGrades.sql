CREATE VIEW aviw_University_StudentsGrades AS
WITH RecentGrades AS (
    SELECT 
        sds.StudentId,
        (s.FirstName + ' ' + s.LastName) AS FullName,
        s.EnrollmentStatus,
        sds.DegreeId,
		sds.EnrollmentDate,
		sds.DropDate,
        c.CourseId,
        c.CourseCredits,
        sds.NumericalGrade,
        (c.CourseCredits * sds.NumericalGrade) AS CalculatedGrade,
        CASE
			WHEN sds.NumericalGrade = 100 THEN 4.0
			WHEN sds.NumericalGrade >= 93 THEN 4.0 - ((100 - sds.NumericalGrade) / 10.0)
			WHEN sds.NumericalGrade >= 64 THEN 4.0 - ((93 - sds.NumericalGrade) / 10.0)
        END AS GPA,
        ROW_NUMBER() OVER (PARTITION BY sds.StudentId, sds.DegreeId, c.CourseId ORDER BY sds.EnrollmentDate DESC) AS RowNum
    FROM 
        atbl_University_StudentsDegreesCourses sds
    JOIN 
        atbl_University_Courses c ON sds.CourseId = c.CourseId
    JOIN 
        atbl_University_Students s ON sds.StudentId = s.StudentId
)
SELECT 
    StudentId,
    FullName,
    EnrollmentStatus,
    DegreeId,
    CAST(SUM(CalculatedGrade) AS DECIMAL(5, 0)) / CAST(SUM(CourseCredits) AS DECIMAL(5, 0)) AS AverageGrade,
    CAST(ROUND(SUM(CourseCredits * GPA) / SUM(CourseCredits), 2) AS DECIMAL(5, 2)) AS GPA
FROM 
    RecentGrades
WHERE 
    RowNum = 1
GROUP BY
    StudentId,
    FullName,
    EnrollmentStatus,
    DegreeId;