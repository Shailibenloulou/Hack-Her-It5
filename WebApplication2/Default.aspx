<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <div class="col-md-7">
            <div id="map-container" class="custom-container" style="width:545px; height:435px;">
               <div class="custom-container-title">Google-Maps Preview</div>
                 <iframe id='ifrMap' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' width="520" height="400" src='https://www.govmap.gov.il/map.html?bb=1&zb=1&in=1&c=204000,595000&z=0&lay=ATAREI_RATAG'> </iframe>
               </div>
        </div>
        
    </form>
</body>
</html>

