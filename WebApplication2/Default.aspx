<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CleanApp</title>
    <script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
    <script src="https://www.govmap.gov.il/govmap/api/govmap.api.js"></script>
    <style type="text/css">
        body{
            direction:rtl;
        }
        #ifrMap {
            width: 637px;
            height: 417px;
        }

    </style>
            <script type="text/javascript">
                $(document).ready(function () {
                    govmap.createMap('map',
                        {
                            token: '5a4b8472-b95b-4687-8179-0ccb621c7990',
                            layers: ["GASSTATIONS", "PARCEL_HOKS", "KSHTANN_ASSETS", "bus_stops", "PARCEL_ALL", "HOF_NAKI_update","ganim_leumim"],
                            showXY: true,
                            //identifyOnClick: true,
                            isEmbeddedToggle: false,
                            background: "1",
                            layersMode: 1,
                            onClick: alert('click event'),
                            zoomButtons: false
                        });
                    });
            </script>
    </head>
     <body>
    
    <form id="form1" runat="server">
        <div class="col-md-7">
            <div id="map" style="width:600px;height:600px" ></div>
           </div> 
        <p >מיקום</p> 
        <p>
            <asp:TextBox  ID="location" runat="server">חוף הצוק</asp:TextBox>
        &nbsp;</p>
        <p>
            רמת נקיות
        </p>
        <p>
            נקי מאוד</p>
        <p>
            האם יש קבוצה</p>
        <p>
            לא</p>
        <p>
            שם
        </p>
        <p>
            יעל</p>
        <p>
            משפחה</p>
        <p>
            גלוברמן</p>
        <p>
            מספר טלפון
        </p>
        <p>
            0527703139</p>
         <p>
             גודל מקסימלי של קבוצה</p>
        <p>
            10</p>
         <p>
             כתובת מייל</p>
        <p>
            yaeli@gmail.com</p>
         <p>
             שם קבוצה</p>
        <p>
            1</p>
         <p>
             &nbsp;</p>
        <p>
            <asp:Button ID="creatGroupButton" runat="server" Text="לחץ ליצירת קבוצה" Width="225px" OnClick="creatGroupButton_Click" />
        </p>
        <p>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="XmlDataSourceY">
            </asp:ListView>
            <asp:XmlDataSource ID="XmlDataSourceY" runat="server"></asp:XmlDataSource>
        </p>
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

