--------------------- Adding Degrees
INSERT INTO atbl_University_Degrees (DegreeId) SELECT 'Computer Science';
INSERT INTO atbl_University_Degrees (DegreeId) SELECT 'Digital Media';
INSERT INTO atbl_University_Degrees (DegreeId) SELECT 'Mathematics';

--------------------- Adding Courses
INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('CHEM1331', 'Fundamentals of Chemistry', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('CHEM2133', 'Inorganic Chemistry Laboratory I', 1, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('CIS3320', 'Data Visualization & Analysis', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('COSC1336', 'Computer Science Programming', 3, 'Introduction to problem solving through computer programming. Students will learn the fundamental principles of computer science, basic hardware and software components of a computer system, computational thinking, basic algorithms, and programming concepts. Students will get hands-on experience in problem solving by designing, writing, testing and debugging programs in a modern programming language.');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('COSC1437', 'Introduction to Programming', 4,
'Fundamental concepts of structured programming; procedures and elementary data structures with a focus on problem solving strategies and implementation; computer organization, structured procedural programming, C/C++ programming language, and algorithm design.');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('COSC2425', 'Computer Organization and Architecture', 4, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('COSC2436', 'Programming and Data Structures', 4, 'Introduction to fundamental data structures: arrays, lists, stacks, queues, hash tables, trees; sorting and searching; graph algorithms; design, analysis, and comparison of algorithms. Correctness verification techniques such as assertions and invariants. Review program specification, unit testing, and debugging.');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('COSC3336', 'Computing Structures', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('COSC3360', 'Fundamentals of Operating Systems', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('COSC3380', 'Databases', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('DIGM1300', 'Introduction to Digital Media', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('DIGM1350', 'Graphics for Digital Media', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('DIGM1376', 'User Experience (UX) Principles', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('DIGM2325', 'Information Technology Applications for Digital Media', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('DIGM2351', 'Web Design', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('DIGM2352', 'Digital Photography', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('DIGM2353', 'Page Layout and Design', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('DIGM1300', 'Introduction to Digital Media', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('ENGL1301', 'First Year Writing I', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('ENGL1302', 'First Year Writing II', 3, 'Detailed study of the principles of rhetoric as applied to analyzing and writing argumentative and persuasive essays; principles and methods of research, culminating in writing a substantial research paper.');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('ENGL2340', 'Cosmic Narratives', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('GEOL1102', 'Introduction to Climate Change Laboratory', 1, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('GEOL1302', 'Introduction to Climate Change', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('GOVT2305', 'US Government: Congress, President & Courts', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('GOVT2306', 'US & Texas Constitutions and Politics', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('HDCS1300', 'Human Ecosystems and Technological Change', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('HIST1301', 'The United States to 1877', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('HIST1302', 'The U.S. Since 1877', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('MATH1311', 'Elementary Mathematical Modeling', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('MATH1313', 'Finite Math with Applications', 3, '');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('MATH2413', 'Calculus I', 4, 'Calculus of rational functions, limits, derivatives, applications of the derivative, antiderivatives, the definite integral with applications, mean value theorem, fundamental theorem of calculus, and numerical integration.');

INSERT INTO atbl_University_Courses (CourseId, CourseName, CourseCredits, CourseDescription)
VALUES ('MATH2414', 'Calculus II', 4, 'Calculus of transcendental functions: additional techniques and applications of integration, indeterminate forms, improper integrals, Taylor’s formula, and infinite series.');

--------------------- Adding Degree Courses
-- Computer Science
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'COSC1336');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'COSC1437');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'COSC2425');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'COSC2436');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'COSC3336');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'COSC3360');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'COSC3380');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'ENGL1301');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'ENGL1302');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'ENGL2340');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'CHEM1331');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'CHEM2133');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'GEOL1102');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'GEOL1302');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'GOVT2305');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'GOVT2306');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'HDCS1300');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'HIST1301');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'HIST1302');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'MATH1311');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'MATH1313');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'MATH2413');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Computer Science', 'MATH2414');
-- Digital Media
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'CIS3320');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'DIGM1300');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'DIGM1350');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'DIGM1376');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'DIGM2325');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'DIGM2351');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'DIGM2352');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'DIGM2353');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'ENGL1301');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'ENGL1302');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'ENGL2340');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'CHEM1331');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'CHEM2133');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'GEOL1102');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'GEOL1302');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'GOVT2305');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'GOVT2306');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'HDCS1300');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'HIST1301');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'HIST1302');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'MATH1311');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'MATH1313');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'MATH2413');
INSERT INTO atbl_University_DegreesCourses (DegreeId, CourseId)
VALUES('Digital Media', 'MATH2414');