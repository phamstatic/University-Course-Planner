CREATE VIEW aviw_University_StudentsExamsGiven AS

SELECT 
	seqa.StudentId,
	seqa.Semester,
	seqa.ExamId,
	e.ExamDescription,
	seqa.QuestionId,
	seq.QuestionOrder,
	eq.Question,
	seqa.AnswerId,
	seqa.AnswerOrder,
	eqa.Answer
	--,eqa.Correct
FROM 
	atbl_University_StudentsExamsQuestionsAnswers seqa
INNER JOIN 
	atbl_University_StudentsExamsQuestions seq 
	ON seqa.QuestionId = seq.QuestionId
	AND seqa.StudentId = seq.StudentId 
	AND seqa.ExamId = seq.ExamId 
	AND seqa.Semester = seq.Semester 
INNER JOIN 
	atbl_University_ExamsQuestionsAnswers eqa ON seqa.AnswerId = eqa.AnswerId 
INNER JOIN 
	atbl_University_ExamsQuestions eq ON seq.QuestionId = eq.QuestionId
INNER JOIN
	atbl_University_Exams e ON seqa.ExamId = e.ExamId