using SimpleNote.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpleNote.Controllers
{
    class TrashNoteController:NoteController
    {
        private claData data = new claData();
        public Boolean InsertTrashNote(int IDNote)
        {
            Boolean check = data.excedata("EXEC procedureInsertTrashNote " + IDNote + ",'" + DateTime.Now + "';");
            return check;
        }     
        public override DataTable getNotes()
        {
            DataTable dt = data.readdata("EXEC procedureGetTrashNote");
            return dt;
        }
        public override DataTable getNotes(string SearchNote)
        {
            DataTable dt = data.readdata("EXEC procedureGetTrashNoteByName '" + SearchNote + "'");
            return dt;
        }
        public override bool DeleteNote(int IDNote)
        {
            Boolean check = data.excedata("EXEC procedureDeleteTrashNote " + IDNote + ";");
            return check;
        }
        public DataTable getNoteTag()
        {
            DataTable dt = data.readdata("EXEC procedureGetTrashNoteTag");
            return dt;
        }
        public override DataTable getNotesbyNoteTag(string NoteTag)
        {
            DataTable dt = data.readdata("EXEC procedureGetTrashNoteByNoteTag '" + NoteTag + "'");
            return dt;
        }
        public override DataTable getNotesbyNoteContent(string NoteContent)
        {
            DataTable dt = data.readdata("EXEC procedureGetTrashNoteByNoteContent'" + NoteContent + "'");
            return dt;
        }
    }
}
