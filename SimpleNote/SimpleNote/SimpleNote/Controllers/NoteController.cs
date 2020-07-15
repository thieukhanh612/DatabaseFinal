using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SimpleNote.Models;

namespace SimpleNote.Controllers
{
    
    class NoteController
    {
        private claData data = new claData();
        public virtual DataTable getNotes()
        {
            DataTable dt = data.readdata("EXEC procedureGetNotes ");
            return dt;
        }
        public Boolean UpdateNoteContent(string NoteContent,int IDNote)
        {
            Boolean check = data.excedata("EXEC procedureUpdateNoteContent "+IDNote+",'"+NoteContent+"'");
            return check;
        }
        public Boolean UpdateNoteName(string NoteName, int IDNote)
        {
            Boolean check = data.excedata("EXEC procedureUpdateNoteName " + IDNote + ",'" + NoteName + "'");
            return check;
        }
        public DataTable getNotes(int IDNote)
        {
            DataTable dt = data.readdata("EXEC procedureGetNoteById " + IDNote + ";");
            return dt;
        }
        public virtual DataTable getNotes(string SearchNote)
        {
            DataTable dt = data.readdata("EXEC procedureGetNoteByNoteName '"+SearchNote+"'");
            return dt;
        }
        public DataTable getNoteName(int IDNote)
        {
            DataTable dt = data.readdata("EXEC procedureGetNoteNameByID " + IDNote + "; ");
            return dt;
        }
        public DataTable getNoteDateCreated(int IDNote)
        {
            DataTable dt = data.readdata("EXEC procedureGetNoteDateCreatedByID " + IDNote + ";");
            return dt;
        }
        public Boolean InsertNote( DateTime NoteDateCreated)
        {
            Boolean check = data.excedata("EXEC procedureInsertNote '" + NoteDateCreated + "';");
            return check;
        }
        public virtual Boolean DeleteNote(int IDNote)
        {
            Boolean check = data.excedata("EXEC procedureDeleteNote " + IDNote + ";");
            return check;
        }
        public virtual DataTable getNotesbyNoteContent(string NoteContent)
        {
            DataTable dt = data.readdata("EXEC procedureGetNoteByNoteContent '"+NoteContent+"'");
            return dt;
        }
        public virtual DataTable getNotesbyNoteTag(string NoteTag)
        {
            DataTable dt = data.readdata("EXEC procedureGetNoteByNoteTag '"+NoteTag+"'");
            return dt;
        }

    }

}
