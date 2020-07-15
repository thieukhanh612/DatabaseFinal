using SimpleNote.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SimpleNote.Models;
using System.Data;

namespace SimpleNote.Controllers
{
    class RemindNoteController:NoteController
    {
        claData data = new claData();
        public Boolean InsertRemindNote(int NoteID, DateTime NoteDate, string NoteStatus)
        {
            Boolean check = data.excedata("EXEC procedureInsertRemindNote " + NoteID + ",'" + NoteDate + "','" + NoteStatus + "');");
            return check;
        }
        public Boolean UpdateRemindNote(int NoteID, DateTime NoteDate, string NoteStatus)
        {
            Boolean check = data.excedata("EXEC procedureUpdateRemindNote " + NoteID + "'" + NoteDate + "','" + NoteStatus + "'");
            return check;
        }       
        public DataTable getRemindNotes(DateTime date)
        {
            DataTable dt = data.readdata("EXEC procedureGetRemindNoteByDate '" + date.Date + "'");
            return dt;
        }
        public int CountRemindNotes(DateTime date)
        {
            DataTable dt = getRemindNotes(date);
            return dt.Rows.Count;
        }
        public override DataTable getNotes()
        {
            DataTable dt = data.readdata(" EXEC procedureGetRemindNote");
            return dt;
        }
        public override bool DeleteNote(int IDNote)
        {
            Boolean check = data.excedata("EXEC procedureDeleteRemindNotes " + IDNote + ";");
            return check;
        }
    }
}
