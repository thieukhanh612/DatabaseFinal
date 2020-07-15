USE SimpleNote
GO
/* 
	Thêm note vào danh sách những note được nhắc nhở
*/
CREATE OR ALTER PROCEDURE procedureInsertRemindNote
(
	@NoteId INT,
	@NoteDate DATETIME2(7),
	@NoteStatus NVARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO dbo.RemindNote
	(
		NoteId,
		NoteDateReminded,
		NoteStatus
	)
	VALUES
	(
		@NoteId,
		@NoteDate,
		@NoteStatus
	)
END
GO
--DROP PROCEDURE dbo.procedureInsertRemindNote
--Go
/* 
	Cập nhật trạng thái, ngày nhắc nhở cho note
*/
CREATE OR ALTER PROCEDURE procedureUpdateRemindNote
(
	@NoteId INT,
	@NoteDate DATETIME2(7),
	@NoteStatus NVARCHAR(MAX)
)
AS
BEGIN
	UPDATE dbo.RemindNote SET
			NoteDateReminded=@NoteDate,
			NoteStatus = @NoteStatus
			WHERE NoteId = @NoteId
END
GO
--DROP PROCEDURE dbo.procedureUpdateRemindNote
--Go
/* 
	Lấy thông tin note bằng ngày
*/
CREATE OR ALTER PROCEDURE procedureGetRemindNoteByDate
(
	@NoteDate DATETIME2(7)
)
AS
BEGIN
	SELECT *  FROM RemindNote WHERE DATEDIFF(day,@NoteDate, NoteDateReminded)=0;
END
GO
--DROP PROCEDURE dbo.procedureGetRemindNoteByDate
--Go
/* 
	Lấy tất cả thông tin của các note
*/
CREATE OR ALTER PROCEDURE procedureGetRemindNote
AS
BEGIN
	SELECT Note.NoteName, RemindNote.NoteDateReminded, RemindNote.NoteStatus,RemindNote.NoteId FROM(Note join RemindNote on Note.NoteID = RemindNote.NoteId) WHERE RemindNote.NoteStatus<>'DONE' ORDER BY RemindNote.NoteDateReminded;
END
GO
--DROP PROCEDURE dbo.procedureGetRemindNote
--Go
/* 
	Xóa nhắc nhở cho note
*/
CREATE OR ALTER PROCEDURE	procedureDeleteRemindNotes
(
	@NoteId INT
)
AS
BEGIN
	DELETE FROM RemindNote WHERE NoteID =@NoteId
END
GO
--DROP PROCEDURE dbo.procedureDeleteRemindNote
--Go
