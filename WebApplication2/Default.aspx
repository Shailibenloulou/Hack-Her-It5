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
            width: 637px;
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
</head>
<body>
    <div id="map" style="width: 500px; height: 600px"></div>
    <form id="form1" runat="server">
        <div class="col-md-7">

            <p>
                מיקום<asp:TextBox ID="location" runat="server" Height="31px" OnTextChanged="location_TextChanged1" style="margin-right: 27px; margin-top: 17px" Width="149px"> </asp:TextBox>
           <%-- &nbsp;<asp:ListView datasourceid="ObjectDataSource1" ID="ListView1" runat="server" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" style="margin-right: 151px; margin-top: 6px">
               <LayoutTemplate>
          <table cellpadding="4" width="500" runat="server" id="tblCountries">
            <tr runat="server">
              <th runat="server">Code</th>
              <th runat="server">Name</th>
            </tr>
            <tr runat="server" id="itemPlaceholder" />
          </table>
                   
        </LayoutTemplate>
                    <ItemTemplate>
                  <tr class="item" runat="server">
                    <td>
                      <asp:Label ID="CountryCodeLabel" runat="server" 
                        Text='<%# Eval("Data")%>' />
                    </td>          
                    <td>
                      <asp:Label ID="NameLabel" runat="server" 
                        Text='<%# Eval("Name")%>' />
                    </td>
                  </tr>
        </ItemTemplate> 
                    
                </asp:ListView>
            </p>

            <asp:objectdatasource
          id="ObjectDataSource1"
          runat="server"
          selectmethod="GetAllPlaces"
          typename=" WebApplication2.Place" />

           <%-- <asp:xmldatasource
        id="XmlDataSource1"
        runat="server"
        datafile="test.xml" >--%>
                
                </asp:xmldatasource>
        </div>

        <p>
            רמת נקיות
        </p>
        <p>
            <asp:TextBox ID="clean" runat="server" OnTextChanged="clean_TextChanged"></asp:TextBox>
        <p>
            האם יש קבוצה
        </p>
        <p>
            <asp:TextBox ID="groupAns" runat="server" OnTextChanged="groupAns_TextChanged"></asp:TextBox>
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
            <asp:Button ID="creatGroupButton" runat="server" Text="לחץ ליצירת קבוצה" Width="225px" DoubleClick="creatGroupButton_Click" />
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