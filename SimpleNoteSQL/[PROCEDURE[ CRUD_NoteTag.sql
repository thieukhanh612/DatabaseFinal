USE SimpleNote
GO

/*
	Cập nhật Tag của Note
*/
CREATE OR ALTER PROCEDURE procedureUpdateNoteTag
(
	@IDNote INT,
	@NoteTag NVARCHAR(MAX)
)
AS
BEGIN
	UPDATE Note SET NoteTag=@NoteTag WHERE NoteId=@IDNote;
END
GO
--DROP PROCEDURE dbo.procedureUpdateNoteTag
--GO
/*
	Hiển thị Tag của Note
*/
CREATE OR ALTER PROCEDURE procedureGetNoteTag
AS
BEGIN
	SELECT DISTINCT Note.NoteTag FROM NOTE WHERE NoteId NOT IN (SELECT Note.NoteId  FROM Note, TrashNote WHERE Note.NoteId = TrashNote.NoteId) AND Note.NoteTag<> 'NULL';
END
GO
--DROP PROCEDURE dbo.procedureGetNoteTag
--GO
/*
	Hiển thị Tag của Note theo ID
*/
CREATE OR ALTER PROCEDURE procedureGetNoteTagById
(
	@IdNote INT
)
AS
BEGIN
	SELECT Note.NoteTag FROM Note WHERE NoteId =@IdNote
END
GO
--DROP PROCEDURE dbo.procedureGetNoteTagById
--GO

