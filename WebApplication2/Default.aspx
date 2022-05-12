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
                    layers: ["GASSTATIONS", "PARCEL_HOKS", "KSHTANN_ASSETS", "bus_stops", "PARCEL_ALL"],
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
</head>
<body>
    <div id="map" style="width: 600px; height: 600px"></div>
    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <div class="col-md-7">



            <p>
                מיקום
            </p>
        </div>

        <p>
            <asp:TextBox ID="location" runat="server">בדיקה</asp:TextBox>
            &nbsp;
        </p>
        <p>
            רמת נקיות
        </p>
        <p>
            <asp:TextBox ID="cleaninesLevel" runat="server"></asp:TextBox>
        </p>
        <p>
            האם יש קבוצה
        </p>
        <p>
            <asp:TextBox ID="isTherAnotherGroup" runat="server"></asp:TextBox>
        </p>
        <p>
            ת.ז.
        </p>
        <p>
            <asp:TextBox ID="id" runat="server"></asp:TextBox>
        </p>
        <p>
            שם
        </p>
        <p>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
        </p>
        <p>
            משפחה
        </p>
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
            גודל מקסימלי של קבוצה
        </p>
        <p>
            <asp:TextBox ID="maxNumOfMemmbers" runat="server"></asp:TextBox>
        </p>
        <p>
            כתובת מייל
        </p>
        <p>
            <asp:TextBox ID="mailAddress" runat="server"></asp:TextBox>
        </p>
        <p>
            שם קבוצה
        </p>
        <p>
            <asp:TextBox ID="nameOfGroup" runat="server"></asp:TextBox>
        </p>

        <p>
            תיאור
        </p>
        <p>
            <asp:TextBox ID="description" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Button ID="creatGroupButton" runat="server" Text="לחץ ליצירת קבוצה" Width="225px" OnClick="creatGroupButton_Click" />
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>

    </form>
</body>
</html>

