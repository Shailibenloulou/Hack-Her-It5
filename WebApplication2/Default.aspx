﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2.Default" %>

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
     <meta charset="utf-8" />

    <!-- Reference to the Bing Maps SDK -->
    <script type='text/javascript'
            src='http://www.bing.com/api/maps/mapcontrol?callback=GetMap&key=[AnkqF7RGil_s1xYZBAo5XV4nDDfltzlNywqVo1K91U_fmy_cHQLfemwzdo7llb1l]' 
            async defer></script>
    
    <script type='text/javascript'>
        function GetMap() {
            var map = new Microsoft.Maps.Map('#myMap');

            //Add your post map load code here.
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-7">
            <div id="map" style="width:600px;height:600px"></div>
          <%--  <script type="text/javascript">
                $(document).ready(function () {
                    govmap.createMap('map',
                        {
                            token: '5a4b8472-b95b-4687-8179-0ccb621c7990',
                            layers: ["GASSTATIONS", "PARCEL_HOKS", "KSHTANN_ASSETS", "bus_stops", "PARCEL_ALL"],
                            showXY: true,
                            identifyOnClick: true,
                            isEmbeddedToggle: false,
                            background: "1",
                            layersMode: 1,
                            zoomButtons: false
                        });

                    govmap.onEvent(govmap.events.CLICK).then(function (e) {
                        alert("click event ");
                    });
                });
            </script> 
        <div class="grid-container">
  <div class="grid-item">1</div>
  --%>

    <div id="myMap" style="position:relative;width:600px;height:400px;"></div>

</div>
    <div id="wrapper" style=" width: 1009px; overflow: hidden;">
        <p>
            מיקום</p>
        </div>
        
        <p>
            <asp:TextBox  ID="location" runat="server">בדיקה</asp:TextBox>
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
            <asp:Button ID="creatGroupButton" runat="server" Text="לחץ ליצירת קבוצה" Width="225px" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p style="height: 147px">
            &nbsp;</p>
    <div id="wrapper" style=" width: 1009px; overflow: hidden;">
       
</div>
        
        </div>
    </form>
</body>
   
</div>
    
</html>

