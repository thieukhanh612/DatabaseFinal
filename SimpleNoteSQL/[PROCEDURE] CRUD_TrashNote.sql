USE SimpleNote
GO
/*Thêm Note vào thùng rác*/
CREATE OR ALTER PROCEDURE procedureInsertTrashNote
(
	@IDNote INT,
	@NoteDateDeleted DATETIME2(7)
)
AS
BEGIN
	INSERT INTO TrashNote
	(
		NoteId,
		NoteDateDeleted
	)
	VALUES
	(
		@IDNote,
		@NoteDateDeleted
	)
END
GO
--DROP PROCEDURE dbo.procedureInsertTrashNote
--GO
/*
	Lấy thông tin note đã xóa
*/
CREATE OR ALTER PROCEDURE procedureGetTrashNote
AS
BEGIN
	SELECT Note.NoteId, Note.NoteName FROM Note INNER JOIN TrashNote ON Note.NoteId = TrashNote.NoteId
END
GO
--DROP PROCEDURE dbo.procedureGetTrashNote
--Go
/*
	Lấy thông tin note đã xóa bằng cách tìm kiếm theo tên Note
*/
CREATE OR ALTER PROCEDURE procedureGetTrashNoteByNoteName
(
	@SearchNote NVARCHAR(MAX)
)
AS
BEGIN
	SELECT NoteId,NoteName FROM Note WHERE CHARINDEX(@SearchNote,NoteName) <>0 AND NoteId IN (SELECT NoteId FROM TrashNote) ORDER BY NoteId DESC
END
GO
--DROP PROCEDURE dbo.procedureGetTrashNoteByNoteName
--GO
/*
	Lấy thông tin note đã xóa bằng cách tìm kiếm theo tên nội dung Note
*/
CREATE OR ALTER PROCEDURE procedureGetTrashNoteByNoteContent
(
	@SearchNote NVARCHAR(MAX)
)
AS
BEGIN
	SELECT NoteId,NoteName FROM Note WHERE CHARINDEX(@SearchNote,NoteContent) <>0 AND NoteId IN (SELECT NoteId FROM TrashNote) ORDER BY NoteId DESC
END
GO
--DROP PROCEDURE dbo.procedureGetTrashNoteByNoteContent
--GO
/*
	Lấy thông tin note đã xóa bằng cách tìm kiếm theo tên Note Tag
*/
CREATE OR ALTER PROCEDURE procedureGetTrashNoteByNoteTag
(
	@SearchNote NVARCHAR(MAX)
)
AS
BEGIN
	SELECT NoteId,NoteName FROM Note WHERE CHARINDEX(@SearchNote,NoteTag) <>0 AND NoteId IN (SELECT NoteId FROM TrashNote) ORDER BY NoteId DESC
END
GO
--DROP PROCEDURE dbo.procedureGetTrashNoteByNoteTag
--GO
/*
	Restore lại Note
*/
CREATE OR ALTER PROCEDURE procedureDeleteTrashNote
(
	@IDNote INT
)
AS
BEGIN
	DELETE FROM TrashNote WHERE NoteId = @IDNote
END
GO
--DROP PROCEDURE dbo.procedureDeleteTrashNote
--GO
/*
	Lấy thông tin NoteTag của các Note đã xóa
*/
CREATE OR ALTER PROCEDURE procedureGetTrashNoteTag
AS
BEGIN
	SELECT DISTINCT Note.NoteTag FROM NOTE WHERE NoteId IN (SELECT Note.NoteId  FROM Note, TrashNote WHERE Note.NoteId = TrashNote.NoteId) AND Note.NoteTag<> 'NULL'
END
GO
--DROP PROCEDURE dbo.procedureGetTrashNoteTag
--GO


