CREATE TRIGGER trg_CheckCorrectAnswer
ON atbl_University_ExamsQuestionsAnswers
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT QuestionId
        FROM inserted
        GROUP BY QuestionId
        HAVING COUNT(CASE WHEN Correct = 1 THEN 1 END) > 1
    )
    BEGIN
        RAISERROR ('A question cannot have more than one correct answer!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
