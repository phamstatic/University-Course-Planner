CREATE TRIGGER atbl_University_StudentsExamsAnswers_AddUpdateTrig
ON atbl_University_StudentsExamsAnswers
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN atbl_University_StudentsExams se ON i.StudentId = se.StudentId AND i.Semester = se.Semester
        WHERE se.StudentId IS NULL
    )
    BEGIN
        RAISERROR ('There is a student not enrolled in a semester OR this student does not have this exam!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

	IF EXISTS (
		SELECT StudentId, QuestionId, Semester
		FROM (
			SELECT StudentId, QuestionId, Semester, COUNT(*) AS NumAnswers
			FROM inserted
			GROUP BY StudentId, QuestionId, Semester
		) AS AnswerCounts
		WHERE NumAnswers > 1
	)
    BEGIN
        RAISERROR ('There can only be one answer per question for a student!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

END;
