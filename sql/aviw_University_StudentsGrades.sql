CREATE VIEW aviw_University_StudentsGrades AS
WITH RecentGrades AS (
    SELECT 
        sds.StudentId,
        (s.FirstName + ' ' + s.LastName) AS FullName,
        s.EnrollmentStatus,
        sds.DegreeId,
        c.CourseId,
        c.CourseCredits,
        sds.NumericalGrade,
        (c.CourseCredits * sds.NumericalGrade) AS CalculatedGrade,
        CASE
            WHEN sds.NumericalGrade  >= 93 THEN 4.0
            WHEN sds.NumericalGrade = 92 THEN 3.9
            WHEN sds.NumericalGrade = 91 THEN 3.8
            WHEN sds.NumericalGrade = 90 THEN 3.7
            WHEN sds.NumericalGrade <= 89 THEN 3.4
            WHEN sds.NumericalGrade <= 86 THEN 3.2
            WHEN sds.NumericalGrade >= 80 AND sds.NumericalGrade <= 84 THEN 2.7
            WHEN sds.NumericalGrade / sds.NumericalGrade = 79 THEN 2.6
            WHEN sds.NumericalGrade = 78 THEN 2.5
            WHEN sds.NumericalGrade = 77 THEN 2.4
            WHEN sds.NumericalGrade >= 75 AND sds.NumericalGrade <= 76 THEN 2.2
            WHEN sds.NumericalGrade >= 73 AND sds.NumericalGrade <= 74 THEN 2
            WHEN sds.NumericalGrade >= 70 AND sds.NumericalGrade <= 72 THEN 1.7
            WHEN sds.NumericalGrade = 69 THEN 1.6
            WHEN sds.NumericalGrade >= 67 AND sds.NumericalGrade <= 68 THEN 1.6
            WHEN sds.NumericalGrade >= 65 AND sds.NumericalGrade <= 66 THEN 1.2
            ELSE 1.0
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
