CREATE VIEW aviw_University_StudentsGrades AS
SELECT 
    Student.StudentId, 
    Student.DegreeId,
    SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) AS AverageGrade,
    CASE
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) >= 93 THEN 4.0
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) = 92 THEN 3.9
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) = 91 THEN 3.8
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) = 90 THEN 3.7
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) >= 87 AND SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) <= 89 THEN 3.4
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) >= 85 AND SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) <= 86 THEN 3.2
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) >= 80 AND SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) <= 84 THEN 2.7
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) = 79 THEN 2.6
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) = 78 THEN 2.5
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) = 77 THEN 2.4
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) >= 75 AND SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) <= 76 THEN 2.2
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) >= 73 AND SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) <= 74 THEN 2
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) >= 70 AND SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) <= 72 THEN 1.7
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) = 69 THEN 1.6
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) >= 67 AND SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) <= 68 THEN 1.6
        WHEN SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) >= 65 AND SUM(Student.NumericalGrade * Course.CourseCredits) / SUM(Course.CourseCredits) <= 66 THEN 1.2
        ELSE 1.0
    END AS GPA,
	(
	SELECT
		CASE
			WHEN EnrollmentStatus = 'FT'
			THEN 
			(120 - SUM(Course.CourseCredits))
			ELSE (120 - SUM(Course.CourseCredits))
		END
	FROM atbl_University_Students 
	WHERE StudentId = Student.StudentId
	) AS ExpectedGraduation
FROM 
    atbl_University_StudentsDegreesCourses Student
JOIN 
    atbl_University_Courses Course ON Student.CourseId = Course.CourseId
GROUP BY 
    Student.StudentId, Student.DegreeId;	