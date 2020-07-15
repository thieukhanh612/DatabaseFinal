using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SimpleNote.Models;

namespace SimpleNote.Controllers
{
    class NoteTagController:NoteController
    {
        claData data = new claData();
        public Boolean UpdateNoteTag(int NoteId, string NoteTag)
        {
            Boolean check = data.excedata("EXEC procedureUpdateNoteTag "+NoteId+",'"+NoteTag+"'");
            return check;
        }
        public DataTable GetNoteTag()
        {
            DataTable dt = data.readdata("EXEC procedureGetNoteTag");
            return dt;
        }
        public DataTable GetNoteTag(int IDNote)
        {
            DataTable dt = data.readdata("EXEC procedureGetNoteTagById " + IDNote + ";");
            return dt;
        }
    
    }
}
