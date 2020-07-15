USE SimpleNote
GO
CREATE OR ALTER VIEW viewGetTrashNote
AS
	SELECT B.NoteId, B.NoteName
	FROM dbo.TrashNote K JOIN dbo.Note B ON K.NoteId=B.NoteId
GO
CREATE OR ALTER VIEW viewGetNote
AS
	SELECT B.NoteId, B.NoteName
	FROM dbo.TrashNote K JOIN dbo.Note B ON K.NoteId <> B.NoteId
GO
CREATE OR ALTER VIEW viewGetTrashNoteTag
AS
	SELECT B.NoteTag
	FROM dbo.TrashNote K JOIN dbo.Note B ON K.NoteId=B.NoteId
GO
CREATE OR ALTER VIEW viewGetNoteTag
AS
	SELECT B.NoteTag
	FROM dbo.TrashNote K JOIN dbo.Note B ON K.NoteId <> B.NoteId
GO
CREATE OR ALTER VIEW viewGetNoteReminded
AS
	SELECT B.NoteId, B.NoteName, K.NoteDateReminded
	FROM dbo.RemindNote K JOIN dbo.Note B ON K.NoteId=B.NoteId
GO

