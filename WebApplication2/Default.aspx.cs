using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Xml.Linq;
using System.Xml.Serialization;
using System.Runtime.CompilerServices;
using System.Xml;
using System.Text;

namespace WebApplication2
{
    public partial class Default : System.Web.UI.Page
    {
        static private int GroupId = 1;

        protected void location_TextChanged(object sender, EventArgs e)
        {

        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        protected void creatGroupButton_Click(object sender, EventArgs e)
        {
            var groupList = XmlTools.LoadListFromXMLSerializer<Group>(@"Groups.xml");
            Group g = new Group();


            g.Id = GroupId++;
            g.Name = nameOfGroup.Text;
            g.Description = description.Text;
            g.MaxSize = int.Parse(maxNumOfMemmbers.Text);
            User u = new User();
            u.Id = int.Parse(id.Text);
            u.FirstName = name.Text;
            u.LastName = lastName.Text;
            u.Email = mailAddress.Text;
            u.Phone = phoneNumber.Text;
            g.Participants = new List<User>() { u };
            g.Area = new Location();//to take location from map
            g.IsFull = false;
            g.IsDone = false;

            //check if location is clean

            //check if there is already a group in this area!
            //if yes, pop up "a group already exists in this area. join group, create anyway"

            if (groupList.Exists(x => x.Area.Equals(new Location())))
            { //to take location from map
                
            }

            groupList.Add(g);

            XmlTools.SaveListToXMLSerializer(groupList, @"C:\Users\chaya\source\repos\Hack-Her-It5\WebApplication2\xml\Groups.xml");
        }
    }

        //    XmlTextWriter xmlwriter = new XmlTextWriter(Server.MapPath("App_Data/Employee.xml"), Encoding.UTF8);

        //    xmlwriter.Formatting = Formatting.Indented;

        //    xmlwriter.WriteStartDocument();

        //    xmlwriter.WriteStartElement("Employees");



        //    xmlwriter.WriteStartElement("Employee");

        //    xmlwriter.WriteAttributeString("type", "Permanent");

        //    xmlwriter.WriteElementString("ID", "100");

        //    xmlwriter.WriteElementString("FirstName", "Satheesh");

        //    xmlwriter.WriteElementString("LastName", "Babu");

        //    xmlwriter.WriteElementString("Dept", "IT");

        //    xmlwriter.WriteEndElement();



        //    xmlwriter.WriteEndElement();

        //    xmlwriter.WriteEndDocument();

        //    xmlwriter.Flush();

        //    xmlwriter.Close();

        //}

        sealed partial class DalXml  //singelton class
        {
            private static DalXml instance = null;
            private static readonly object padlock = new object();
            public static DalXml Instance
            {
                get
                {
                    if (instance == null)
                        lock (padlock)
                        {
                            if (instance == null)
                                instance = new DalXml();
                        }
                    return instance;
                }
            }
            readonly string GroupPath;  //variable for saving Station.xml
            #region Constructor
            DalXml()
            {
                //inisializing the path with the files
                GroupPath = @"Group.xml";
            }
            #endregion

            #region Save and Load With XMLSerializer
            /// <summary>
            /// XML serialization enables an object's public fields and properties to be saved and loaded to an XML file.
            /// </summary>
            /// <typeparam name="T">the type of list entered</typeparam>
            /// <param name="list"> the list entered</param>
            /// <param name="filePath">the path of the file entered</param>
            public static void SaveListToXMLSerializer<T>(List<T> list, string filePath)
            {
                try
                {
                    FileStream file = new FileStream(filePath, FileMode.Create);  //Create a file with the path entered
                    XmlSerializer x = new XmlSerializer(list.GetType()); //Creates an instance of the XmlSerializer class and specifies the type of the list to serialize.
                    x.Serialize(file, list); //The Serialize method is used to serialize an object to XML, the list to the file.
                    file.Close(); //close the file
                }
                catch (Exception)
                {
                    throw new XmlFileCreationFailException(filePath);
                }
            }

            /// <summary>
            /// XML serialization enables an object's public fields and properties to be saved and loaded to/from an XML file.
            /// </summary>
            /// <typeparam name="T">the type of list entered</typeparam>
            /// <param name="filePath">the path of the file entered</param>
            /// <returns></returns>
            public static List<T> LoadListFromXMLSerializer<T>(string filePath)
            {
                try
                {
                    if (File.Exists(filePath))
                    {
                        List<T> list;
                        XmlSerializer x = new XmlSerializer(typeof(List<T>)); //Creates an instance of the XmlSerializer class and specifies the type of the list to serialize according to the type entered
                        FileStream file = new FileStream(filePath, FileMode.Open);  //Open the file with the path entered
                        list = (List<T>)x.Deserialize(file); //deserialization is the reversed process of serialization. get back the serialized object so that it can be loaded into memory.
                        file.Close(); //close the file
                        return list;
                    }
                    else
                        return new List<T>();
                }
                catch (Exception)
                {
                    throw new XmlFileCreationFailException(filePath);
                }
            }
            #endregion
        }
    }
}
