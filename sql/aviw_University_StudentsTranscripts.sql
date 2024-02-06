CREATE VIEW aviw_University_StudentsTranscripts AS
SELECT 
    Student.StudentId,
    (Student.FirstName + ' ' + Student.LastName) AS FullName,
    StudentCourses.CourseId,
    Course.CourseName,
    STRING_AGG(CONVERT(NVARCHAR, StudentCourses.NumericalGrade) + ' (' + StudentCourses.LetterGrade + ' in ' + StudentCourses.Semester + ')', ', ') AS Grades
FROM 
    atbl_University_Students Student
JOIN 
    atbl_University_StudentsDegreesCourses StudentCourses ON Student.StudentId = StudentCourses.StudentId
JOIN 
    atbl_University_Courses Course ON StudentCourses.CourseId = Course.CourseId
GROUP BY
    Student.StudentId,
    Student.FirstName,
    Student.LastName,
    StudentCourses.CourseId,
    Course.CourseName;