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
using System.Data;
using System.Net.Mail;
using System.Net;

namespace WebApplication2
{
    public partial class Default : System.Web.UI.Page
    {
        string UserPlace;
        public Default()
        {

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindXml();
            }
        }
        private void BindXml()
        {
            string filePath = Server.MapPath("/test.xml");
            using (DataSet ds = new DataSet())
            {
                ds.ReadXml(filePath);
                ddlCities.DataSource = ds;
                ddlCities.DataTextField = "Name";
                ddlCities.DataValueField = "Data";
                ddlCities.DataBind();
            }
        }


        protected void ddlCities_SelectedIndexChanged(object sender, EventArgs e)
        {
            clean.Text = ddlCities.SelectedValue;
            UserPlace = ddlCities.SelectedItem.Text;
            if (clean.Text == "נקי" || clean.Text == "נקי מאוד")
            {
                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                Label9.Visible = false;
                Label10.Visible = false;
                Label11.Visible = false;


                DropDownGroup.Visible = false;
                checkBoxJoinGroup.Visible = false;
                CheckBox1.Visible = false;
                id.Visible = false;
                name.Visible = false;
                lastName.Visible = false;
                phoneNumber.Visible = false;
                maxNumOfMemmbers.Visible = false;
                mailAddress.Visible = false;
                nameOfGroup.Visible = false;
                description.Visible = false;
                buttomCreatGroupButton.Visible = false;
                buttonJoinGroup.Visible = false;
                return;
                //hidden buttons
                //offer another place
            }
            else
            {
                Label1.Visible = true;
                Label2.Visible = true;
                Label3.Visible = true;
                Label4.Visible = true;
                Label5.Visible = true;
                Label6.Visible = true;
                Label7.Visible = true;
                Label8.Visible = true;
                Label9.Visible = true;
                Label10.Visible = true;
                Label11.Visible = true;

                DropDownGroup.Visible = true;
                checkBoxJoinGroup.Visible = true;
                CheckBox1.Visible = true;
                id.Visible = true;
                name.Visible = true;
                lastName.Visible = true;
                phoneNumber.Visible = true;
                maxNumOfMemmbers.Visible = true;
                mailAddress.Visible = true;
                nameOfGroup.Visible = true;
                description.Visible = true;
                buttomCreatGroupButton.Visible = true;
                buttonJoinGroup.Visible = true;
                string filePath1 = Server.MapPath("/xml/Groups.xml");
                List<Group> groupList = XmlTools.LoadListFromXMLSerializer<Group>(filePath1).FindAll(g => g.Name == UserPlace && !g.IsDone && !g.IsFull);

                string filePath = Server.MapPath("/GroupsFiltered.xml");
                XmlTools.SaveListToXMLSerializer(groupList, filePath);
                this.BindXml2();
            }
        }
        private void BindXml2()
        {
            string filePath = Server.MapPath("/GroupsFiltered.xml");
            using (DataSet ds = new DataSet())
            {
                ds.ReadXml(filePath);
                DropDownGroup.DataSource = ds;
                DropDownGroup.DataTextField = "Name";
                DropDownGroup.DataValueField = "IsFull";
                DropDownGroup.DataValueField = "IsDone";
                DropDownGroup.DataBind();
            }
        }
        static private int GroupId = 1;

        protected void DropDownGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            string n = DropDownGroup.SelectedValue;
            List<Group> groups = XmlTools.LoadListFromXMLSerializer<Group>(@"Groups.xml");
            Group group = groups.Find(g=>g.Name==n);
            User u = new User();
            u.Id = int.Parse(id.Text);
            u.FirstName = name.Text;
            u.LastName = lastName.Text;
            u.Email = mailAddress.Text;
            u.Phone = phoneNumber.Text;
            group.Participants.Add(u);

            XmlTools.SaveListToXMLSerializer(groups, @"C:\Users\שילי\source\repos\Hack-Her-It5\WebApplication2\xml\Groups.xml");
        }


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

            XmlTools.SaveListToXMLSerializer(groupList, @"C:\Users\yaeli\source\repos\Hack-Her-It5_here\WebApplication2\Group.cs");
            SendEmail();

        }
        /// <summary>
        /// sends an email to the new user
        /// </summary>
        private void SendEmail()
        {
            // Create a System.Net.Mail.MailMessage object
            MailMessage message = new MailMessage();

            // Add a recipient
            message.To.Add(mailAddress.Text);

            // Add a message subject
            message.Subject = "Account activation";

            // Add a message body
            message.Body = "שלום " + name.Text + "\n" +
                "תודה רבה שנרשמת לאתר CleaNature.\n" +
                "אנחנו שמחים שבחרת ללכת ולנקות את ארץ ישראל שלנו.\n" +
                "" +
                "לכל פניה או בקשה פנה אלינו במייל customerService@CleaNature.com ,\n" +
                " CleaNature בברכה צוות ";

            // Create a System.Net.Mail.MailAddress object and 
            // set the sender email address and display name.
            message.From = new MailAddress("CleaNature@gmail.com", "CleNature");

            // Create a System.Net.Mail.SmtpClient object
            // and set the SMTP host and port number
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);

            // If your server requires authentication add the below code
            // =========================================================
            // Enable Secure Socket Layer (SSL) for connection encryption
            smtp.EnableSsl = true;

            // Do not send the DefaultCredentials with requests
            smtp.UseDefaultCredentials = false;

            // Create a System.Net.NetworkCredential object and set
            // the username and password required by your SMTP account
            smtp.Credentials = new NetworkCredential("CleaNature@gmail.com", "xxx");
            // =========================================================

            // Send the message
            smtp.Send(message);
        }
        protected void joinGroupButton_Click(object sender, EventArgs e)
        {

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void location_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void clean_TextChanged(object sender, EventArgs e)
        {

        }

        protected void groupAns_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

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
}