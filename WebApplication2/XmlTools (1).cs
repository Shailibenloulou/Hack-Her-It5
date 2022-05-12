using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace WebApplication2
{
    public static class XmlTools
    {
        static XmlTools() { }

        //#region Save and Load With XElement
        //public static void SaveListToXMLElement(XElement rootElem, string filePath)
        //{
        //        rootElem.Save(filePath);
        //}

        //public static XElement LoadListFromXMLElement(string filePath)
        //{
        //        if (File.Exists(filePath))
        //        {
        //            return XElement.Load(filePath);
        //        }
        //        else
        //        {
        //            XElement rootElem = new XElement(filePath);
        //            rootElem.Save(filePath);
        //            return rootElem;
        //        }
        //}
        //#endregion

        #region Save and Load With XMLSerializer
        public static void SaveListToXMLSerializer<T>(List<T> list, string filePath)
        {
            FileStream file = new FileStream(filePath, FileMode.Create);
            XmlSerializer x = new XmlSerializer(list.GetType());
            x.Serialize(file, list);
            file.Close();
        }

        public static List<T> LoadListFromXMLSerializer<T>(string filePath)
        {
            if (File.Exists(filePath))
            {
                List<T> list;
                XmlSerializer x = new XmlSerializer(typeof(List<T>));
                FileStream file = new FileStream(filePath, FileMode.Open, FileAccess.ReadWrite, FileShare.ReadWrite);
                list = (List<T>)x.Deserialize(file);
                file.Close();
                return list;
            }
            else
                return new List<T>();
        }
    }
    #endregion
}

