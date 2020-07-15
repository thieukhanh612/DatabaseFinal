USE SimpleNote
GO

CREATE OR ALTER PROCEDURE procedureUpdateNoteContentFontStyle
(
	@IDNote INT,
	@style NVARCHAR(MAX)
)
AS
BEGIN
	UPDATE Note SET 
		NoteContentStyle=@style  
		WHERE NoteId=@IDNote;
END
GO
--DROP PROCEDURE dbo.procedureUpdateNoteContentFontStyle
--GO
/*
	Cập nhật màu chữ cho nội dung Note
*/
CREATE OR ALTER PROCEDURE procedureUpdateNoteContentColor
(
	@color NVARCHAR(MAX),
	@IDNote INT
)
AS
BEGIN
	UPDATE Note SET 
		NoteContentColor=@color
		WHERE NoteId=@IDNote;
END
GO
--DROP PROCEDURE dbo.procedureUpdateNoteContentColor
--GO
/*
	Hiển thị thông tin phông chữ của Note
*/
CREATE OR ALTER PROCEDURE procedureGetNoteContentFontStyle
(
	@IDNote INT
)
AS
BEGIN
	SELECT NoteContentStyle FROM Note WHERE NoteId=@IDNote;
END
GO
--DROP PROCEDURE dbo.procedureGetNoteContentFontStyle
--GO
/*
	Hiển thị thông tin màu chữ của Note
*/
CREATE OR ALTER PROCEDURE procedureGetNoteContentColor
(
	@IDNote INT
)
AS
BEGIN
	SELECT NoteContentColor FROM Note WHERE NoteId=@IDNote;
END
GO
--DROP PROCEDURE dbo.procedureGetNoteContentColor
--GO
