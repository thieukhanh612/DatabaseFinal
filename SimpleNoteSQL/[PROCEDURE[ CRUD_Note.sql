USE SimpleNote
GO
/*
	Lấy danh sách note
*/
CREATE OR ALTER PROCEDURE procedureGetNotes
AS
BEGIN
	SELECT Note.Noteid, Note.NoteName FROM NOTE WHERE NoteId NOT IN (SELECT Note.NoteId  FROM Note, TrashNote WHERE Note.NoteId = TrashNote.NoteId) ORDER BY NoteId DESC;
END
GO
--DROP PROCEDURE dbo.procedureGetNotes
--GO

/*
	Hiển thị nội dung note bằng ID
*/
CREATE OR ALTER PROCEDURE procedureGetNoteByID
(
	@IDNote INT
)
AS
BEGIN
	SELECT NoteContent FROM Note WHERE NoteId=@IDNote
END
GO
--DROP PROCEDURE dbo.procedureGetNoteById
--GO
/*
	Hiển thị thông tin note bằng cách tìm kiếm tên note
*/
CREATE OR ALTER PROCEDURE procedureGetNoteByNoteName
(
	@SearchNote NVARCHAR(MAX)
)
AS
BEGIN
	SELECT NoteId, NoteName FROM Note WHERE CHARINDEX(@SearchNote,NoteName) <>0 AND NoteId NOT IN (SELECT NoteId FROM TrashNote) ORDER BY NoteId DESC;
END
GO
--DROP PROCEDURE dbo.procedureGetNoteByNoteName
--GO
/*
	Hiển thị thông tin note bằng cách tìm kiếm theo nội dung Note
*/
CREATE OR ALTER PROCEDURE procedureGetNoteByNoteContent
(
	@SearchNote NVARCHAR(MAX)
)
AS
BEGIN
	 SELECT NoteId, NoteName FROM Note WHERE CHARINDEX(@SearchNote,NoteContent) <>0 AND NoteId NOT IN (SELECT NoteId FROM TrashNote) ORDER BY NoteId DESC
END
GO
--DROP PROCEDURE dbo.procedureGetNoteByNoteContent
--GO
/*
	Hiển thị thông tin note bằng cách tìm kiếm theo Note Tag
*/
CREATE OR ALTER PROCEDURE procedureGetNoteByNoteTag
(
	@SearchNote NVARCHAR(MAX)
)
AS
BEGIN
	SELECT NoteId,NoteName FROM Note WHERE CHARINDEX(@SearchNote,NoteTag) <>0 AND NoteId NOT IN (SELECT NoteId FROM TrashNote) ORDER BY NoteId DESC
END
GO
--DROP PROCEDURE dbo.procedureGetNoteByNoteName
--GO
/*
	Hiển thị tên của Note bằng IDNote
*/
CREATE OR ALTER PROCEDURE procedureGetNoteNameByID
(
	@IDNote INT
)
AS
BEGIN
	SELECT NoteName FROM Note WHERE NoteId=@IDNote
END
GO
--DROP PROCEDURE dbo.procedureGetNoteNameByID
--GO
/*
	Hiển thị ngày tạo Note bằng IDNote
*/
CREATE OR ALTER PROCEDURE procedureGetNoteDateCreatedByID
(
	@IDNote INT
)
AS
BEGIN
	SELECT NoteDateCreated FROM Note WHERE NoteId=@IDNote
END
GO
--DROP PROCEDURE dbo.procedureGetNoteDateCreatedByID
--GO

/*
	Chèn thêm thông tin Note
*/
CREATE OR ALTER PROCEDURE procedureInsertNote
( 
	@NoteDateCreated datetime2(7)
)
AS
BEGIN
	INSERT INTO dbo.Note
	(
		NoteName,
		NoteDateCreated
	)
	VALUES
	(
		'New Note.....',
		@NoteDateCreated
	)
END
GO
--DROP PROCEDURE dbo.procedureInsertNote
--GO
/* 
	Xóa vĩnh viễn thông tin của Note
*/
CREATE OR ALTER PROCEDURE procedureDeleteNote
(
	@IDNote INT
)
AS
BEGIN
	DELETE FROM NOTE WHERE NoteId=@IDNote
END
GO
--DROP PROCEDURE dbo.procedureDeleteNote
--GO
/*
	Sửa đổi nội dung của Note
*/
CREATE OR ALTER PROCEDURE procedureUpdateNoteContent
(
	@IDNote INT,
	@NoteContent NVARCHAR(max)
)
AS
BEGIN
	UPDATE dbo.Note SET								
					NoteContent=@NoteContent
			WHERE	NoteId=@IDNote
END
GO
--DROP PROCEDURE dbo.procedureUpdateNoteContent
--GO
/*
	Sửa đổi tên của Note
*/
CREATE OR ALTER PROCEDURE procedureUpdateNoteName
(
	@IDNote INT,
	@NoteName NVARCHAR(MAX)
)
AS
BEGIN
	UPDATE dbo.Note SET								
					NoteName=@NoteName
			WHERE	NoteId=@IDNote
END
GO
--DROP PROCEDURE dbo.procedureUpdateNoteName
--GO
/*
	Danh sách tên Note
*/
CREATE OR ALTER PROCEDURE procedureGetNoteName
AS
BEGIN
	SELECT NoteId, NoteName FROM dbo.Note
END
GO
--DROP PROCEDURE dbo.procedureGetNoteName
--GO
/*
	Cập nhật phông chữ cho nội dung Note
*/

