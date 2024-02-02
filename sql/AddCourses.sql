INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CoursePrerequisites, CourseDescription)
VALUES (
'COSC1336', 
'Computer Science Programming', 
3,
'A grade of C- or better in MATH 1314 or equivalent.',
'Introduction to problem solving through computer programming. Students will learn the fundamental principles of computer science, basic hardware and software components of a computer system, computational thinking, basic algorithms, and programming concepts. Students will get hands-on experience in problem solving by designing, writing, testing and debugging programs in a modern programming language.'
);

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CoursePrerequisites, CourseDescription)
VALUES (
'COSC1437', 
'Introduction to Programming', 
3,
'A grade of C- or better in COSC 1336, and credit for or concurrent enrollment in MATH 2413.',
'Fundamental concepts of structured programming; procedures and elementary data structures with a focus on problem solving strategies and implementation; computer organization, structured procedural programming, C/C++ programming language, and algorithm design.'
);

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CoursePrerequisites, CourseDescription)
VALUES (
'COSC2436', 
'Programming and Data Structures', 
4,
'A grade of C- or better in COSC 1437 and credit for or concurrent enrollment in MATH 2414.',
'Introduction to fundamental data structures: arrays, lists, stacks, queues, hash tables, trees; sorting and searching; graph algorithms; design, analysis, and comparison of algorithms. Correctness verification techniques such as assertions and invariants. Review program specification, unit testing, and debugging.'
);

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CoursePrerequisites, CourseDescription)
VALUES (
'ENGL1301', 
'First Year Writing I', 
3,
'A TSI placement score of at least 340, and an essay score of at least a 4 on the TSI Writing Assessment; or a placement score of less than 340, and an ABE Diagnostic level of at least 4, and an essay score of at least 5 on the TSI Writing Assessment; and a score ranging from 351 to 390 on the TSI Reading Assessment. Students may exempt the TSI by obtaining satisfactory scores on other accepted standardized tests. See http://www.uh.edu/ussc/tsi/ for details.',
''
);

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CoursePrerequisites, CourseDescription)
VALUES (
'ENGL1302', 
'First Year Writing II', 
3,
'ENGL 1301 or equivalent.',
'Detailed study of the principles of rhetoric as applied to analyzing and writing argumentative and persuasive essays; principles and methods of research, culminating in writing a substantial research paper.'
);

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CoursePrerequisites, CourseDescription)
VALUES (
'MATH2413', 
'Calculus I', 
4,
'Credit for MATH 2312 with a grade of C- or higher, or a satisfactory score on a placement examination.',
'Calculus of rational functions, limits, derivatives, applications of the derivative, antiderivatives, the definite integral with applications, mean value theorem, fundamental theorem of calculus, and numerical integration.'
);

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CoursePrerequisites, CourseDescription)
VALUES (
'MATH2414', 
'Calculus II', 
4,
'Credit for MATH 2413 with a grade of C- or higher.',
'Calculus of transcendental functions: additional techniques and applications of integration, indeterminate forms, improper integrals, Taylor’s formula, and infinite series.'
);

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CoursePrerequisites, CourseDescription)
VALUES (
'ALOT1234', 
'Alot of Credits', 
32,
'',
'Test max credits functionality.'
);

SELECT * FROM atbl_University_Courses;