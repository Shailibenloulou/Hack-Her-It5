<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #ifrMap {
            width: 637px;
            height: 417px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-7">
            <div id="map-container" class="custom-container" style="width:1511px; height:435px;">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <iframe id='ifrMap' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='https://www.govmap.gov.il/map.html?bb=1&zb=1&in=1&c=204000,595000&z=0&lay=ATAREI_RATAG'></iframe>
                <br />
                <br />
                <br />
               </div>
        
        <p>
            מיקום</p>
        </div>
        
        <p>
            <asp:TextBox ID="location" runat="server"></asp:TextBox>
        &nbsp;</p>
        <p>
            רמת נקיות
        </p>
        <p>
            <asp:TextBox ID="cleaninesLevel" runat="server"></asp:TextBox>
        </p>
        <p>
            האם יש קבוצה</p>
        <p>
            <asp:TextBox ID="isTherAnotherGroup" runat="server"></asp:TextBox>
        </p>
        <p>
            שם
        </p>
        <p>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
        </p>
        <p>
            משפחה</p>
        <p>
            <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
        </p>
        <p>
            מספר טלפון
        </p>
        <p>
            <asp:TextBox ID="phoneNumber" runat="server"></asp:TextBox>
        </p>
         <p>
             גודל מקסימלי של קבוצה</p>
        <p>
            <asp:TextBox ID="maxNumOfMemmbers" runat="server"></asp:TextBox>
        </p>
         <p>
             כתובת מייל</p>
        <p>
            <asp:TextBox ID="mailAddress" runat="server"></asp:TextBox>
        </p>
         <p>
             שם קבוצה</p>
        <p>
            <asp:TextBox ID="nameOfGroup" runat="server"></asp:TextBox>
        </p>
         <p>
             &nbsp;</p>
        <p>
            <asp:Button ID="creatGroupButton" runat="server" OnClick="creatGroupButton" Text="לחץ ליצירת קבוצה" Width="225px" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        
    </form>
</body>
</html>

