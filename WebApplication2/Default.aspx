<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>CleanApp</title>
    <script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
    <script src="https://www.govmap.gov.il/govmap/api/govmap.api.js"></script>
    <style type="text/css">
        body {
            background-color: lightgoldenrodyellow;
            direction: rtl;
        }

        #ifrMap {
            width: 50%;
            height: 417px;
        }

        .auto-style1 {
            width: 226px;
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
    <script type="text/css">
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

    <div id="div2">
        <form id="form1" runat="server">
            <!--  <div class="col-md-7"></div>-->
            <table>
                <tr>
                    <td>
                        <br />
                        <span>מיקום</span>
                        </asp:xmldatasource><p>
                            <asp:DropDownList ID="ddlCities" runat="server" AutoPostBack="True" Height="23px" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged">
                            </asp:DropDownList>
                             
                       
                    </td>
                    <td>
                        <br />
                        <span style="color: red; background-color: blue">רמת נקיות</span>

                        <div>
                            <asp:TextBox ID="clean" runat="server" OnTextChanged="clean_TextChanged" BackColor="Yellow"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <br />
                        <span>
                            <asp:Label ID="Label1" runat="server" Text="הכנס פרטים ובחר קבוצה"></asp:Label> </span>


                        <div>
                            <asp:DropDownList ID="DropDownGroup" runat="server" AutoPostBack="True" Height="23px" OnSelectedIndexChanged="DropDownGroup_SelectedIndexChanged" Width="175px">
                            </asp:DropDownList>
                        </div>
                    </td>
                    <td></td>
                    <td></td>
                    <td align="left" rowspan="3" colspan="4" style="width: 50%">
                        <div id="map" style="width: 500px; height: 500px;"></div>
                    </td>
                    ..<td>
                        <div id="wrapper">
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                            <asp:Label ID="Label2" runat="server" Text="האם אתה רוצה להצטרף לקבוצה קיימת"></asp:Label></span>

                        <div>
                            <asp:CheckBox ID="checkBoxJoinGroup" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" BorderColor="Red" />
                        </div>
                    </td>

                    <td><span>
                        <asp:Label ID="Label3" runat="server" Text="האם אתה רוצה ליצור קבוצה חדשה"></asp:Label></span>

                        <div>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </div>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                            <asp:Label ID="Label4" runat="server" Text="ת.ז."></asp:Label></span>

                        <div>
                            <asp:TextBox ID="id" runat="server" BorderStyle="Double"></asp:TextBox>
                        </div>
                    </td>
                    <td>
                        <span>
                            <asp:Label ID="Label5" runat="server" Text="שם"></asp:Label></span>


                        <div>
                            <asp:TextBox ID="name" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <span>
                            <asp:Label ID="Label6" runat="server" Text="משפחה"></asp:Label></span>
                        <div>
                            <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td>
                        <span>
                            <asp:Label ID="Label7" runat="server" Text="מספר טלפון"></asp:Label></span>

                        <div>
                            <asp:TextBox ID="phoneNumber" runat="server"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <span>
                            <asp:Label ID="Label8" runat="server" Text="גודל מקסימלי של קבוצה"></asp:Label></span>

                        <div>
                            <asp:TextBox ID="maxNumOfMemmbers" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td>
                        <br />
                        <span>
                            <asp:Label ID="Label9" runat="server" Text="כתובת מייל"></asp:Label></span>

                        <div>
                            <asp:TextBox ID="mailAddress" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <br />
                        <span>
                            <asp:Label ID="Label10" runat="server" Text="שם קבוצה"></asp:Label></span>

                        <div>
                            <asp:TextBox ID="nameOfGroup" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td>
                        <br />
                        &nbsp;</td>
                    <td>
                        <br />
                        &nbsp;<span><asp:Label ID="Label11" runat="server" Text="תיאור"></asp:Label></span>
                        <div>
                            <asp:TextBox ID="description" runat="server"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <br />

                        <div>
                            <asp:Button ID="buttomCreatGroupButton" BackColor="LightGreen" BorderColor="WhiteSmoke" runat="server" Text="לחץ ליצירת קבוצה" Width="225px" OnClick="creatGroupButton_Click" />
                        </div>
                    </td>
                    <td>
                        <br />
                        <br />
                        <br />
                        <div>
                            <asp:Button ID="buttonJoinGroup" BackColor="LightGreen" BorderColor="WhiteSmoke" runat="server" Text="לחץ להצטרפות לקבוצה" Width="193px" OnClick="joinGroupButton_Click" />
                        </div>

                    </td>
                </tr>
            </table>
        </form>
    </div>
    </div>
</body>
</html>
