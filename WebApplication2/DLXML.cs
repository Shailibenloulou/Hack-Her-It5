using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace WebApplication2
{
    public class DLXML 
    {
        #region beach
        public static List<Place> beaches;
        string beachFilePath = @"C:\Users\chagi\source\repos\WebApplication2\WebApplication2\test.xml";


        public DLXML()
        {
                    beaches = new List<Place>();
                    beaches = WebApplication2.XmlTools.LoadListFromXMLSerializer<Place>(beachFilePath);

        }

        //public IEnumerable<DO.Student> GetAllStudents(Func<DO.Student, bool> predicat = null)
        //{
        //    List<DO.Student> studentList = DL.XMLTools.LoadListFromXMLSerializer<DO.Student>(studentFilePath);
        //    var v = from item in studentList
        //            select item; //item.Clone();

        //    if (predicat == null)
        //        return v.AsEnumerable().OrderByDescending(s => s.StudentId);

        //    return v.Where(predicat).OrderByDescending(s => s.StudentId);
        //}


        #endregion
    }
}
