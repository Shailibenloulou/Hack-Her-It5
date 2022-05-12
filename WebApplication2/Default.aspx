<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CleanApp</title>
    <script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
    <script src="https://www.govmap.gov.il/govmap/api/govmap.api.js"></script>
    <style type="text/css">
        body {
            direction: rtl;
        }

        #ifrMap {
            width: 50%;
            height: 417px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            govmap.createMap('map',
                {
                    token: '5a4b8472-b95b-4687-8179-0ccb621c7990',
                    layers: ["HOF_NAKI_update"],
                    showXY: true,
                    identifyOnClick: true,
                    isEmbeddedToggle: false,
                    background: "1",
                    layersMode: 1,
                    zoomButtons: true
                });

            govmap.onEvent(govmap.events.CLICK).then(function (e) {
                alert("click event ");
            });
        });
    </script>
    <script  type="text/css">
#wrapper {
    width: 500px;
    border: 1px solid black;
    overflow: auto; /* so the size of the wrapper is alway the size of the longest content */
}
#map {
    float: left;
    width: 300px;
    border: 1px solid red;
}
#div2 {
    border: 1px solid green;
    margin: 0 0 0 302px; /* considering the border you need to use a margin so the content does not float under the first div*/
}</script>
</head>
<body>
   <div id="wrapper"> <div id="map" style="width:50%"></div>
  <div id="div2">  <form id="form1" runat="server">
      <!--  <div class="col-md-7"></div>-->
            <table>
<tr></tr><tr><td>
        <br/>
            <span>    מיקום</span>
   <div> <asp:TextBox ID="location" runat="server" Height="19px" OnTextChanged="location_TextChanged1" ></asp:TextBox></div>
     
  
      </td>
          <td>
               <br/>
           <span style="color:red; background-color:blue"> רמת נקיות</span>        
        
           <div> <asp:TextBox ID="clean" runat="server" OnTextChanged="clean_TextChanged" BackColor="Yellow"></asp:TextBox></div>
        </td>
           <td>
                <br/>
          <span>  האם יש קבוצה </span>
       
        
          <div>  <asp:TextBox ID="groupAns" runat="server" OnTextChanged="groupAns_TextChanged"></asp:TextBox></div>
        </td></tr><tr></tr><tr>
           <td>
         <span>   האם אתה רוצה להצטרף לקבוצה קיימת</span>
        
          <div>  <asp:CheckBox ID="checkBoxJoinGroup"  runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" BorderColor="Red" />
      </div></td>
           
           <td><span>
            האם אתה רוצה ליצור קבוצה חדשה</span>
        
        <div><asp:CheckBox ID="CheckBox1" runat="server" /></div>
        <br />
             </td></tr><tr></tr><tr>
             <td>
          <span>  ת.ז.</span>
        
           <div> <asp:TextBox ID="id" runat="server" BorderStyle="Double"></asp:TextBox></div>
        </td><td>
      <span>      שם</span>
        
        
        <div> <asp:TextBox ID="name" runat="server"></asp:TextBox></div>
       </td><td><span>
            משפחה
        </span><div>
            <asp:TextBox ID="lastName" runat="server"></asp:TextBox></div>
     </td><td>
           <span> מספר טלפון</span>

          <div> <asp:TextBox ID="phoneNumber" runat="server"></asp:TextBox></div></td>
                 </tr><tr></tr><tr></tr><tr>
             <td>
                 <br/>
          <span>גודל מקסימלי של קבוצה</span>
       
          <div>  <asp:TextBox ID="maxNumOfMemmbers" runat="server"></asp:TextBox></div>
      </td><td> <br/>
          <span>  כתובת מייל</span>
      
         <div>   <asp:TextBox ID="mailAddress" runat="server"></asp:TextBox></div></td>
       <td> <br/>
        <span>שם קבוצה</span>
     
        <div>    <asp:TextBox ID="nameOfGroup" runat="server"></asp:TextBox></div>
           </td><td> <br/>
<       <span>תיאור</span>
        <div>    <asp:TextBox ID="description" runat="server"></asp:TextBox></div></td></tr><tr></tr><tr>
       <td>
          <br/><br/>
       
         <div>   <asp:Button ID="buttomCreatGroupButton" runat="server" Text="לחץ ליצירת קבוצה" Width="225px" DoubleClick="creatGroupButton_Click" /></div>
      </td><td>
          <br/><br/>
      <div><asp:Button ID="buttonJoinGroup" runat="server" Text="לחץ להצטרפות לקבוצה" Width="193px" DoubleClick="joinGroupButton_Click" /></div>
       
        </td>
      </tr>
        </table>
    </form>
       </div>
       </div>
</body>
</html>