<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>CleanNature</title>
    <script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
    <script src="https://www.govmap.gov.il/govmap/api/govmap.api.js"></script>
    <style type="text/css">
        body {
            background-color: lightYellow;
            direction: rtl;
           
        }

        #ifrMap {
            width: 50%;
            height: 417px;
        }
        .auto-style4 {
            width: 265px;
        }
        .auto-style5 {
            width: 855px;
        }
/* When moving the mouse over the close button */
.closebtn:hover {
  color: black;
}
         <p style="font-family: Roboto, Lato, sans-serif" 
id="roboto-plus-backups">New York</p>
        .auto-style6 {
            width: 244px;
        }
        .auto-style7 {
            width: 196px;
        }
        .auto-style8 {
            width: 100%;
            height: 126px;
        }
        .auto-style9 {
            width: 103px;
        }
        .auto-style10 {
            width: 176px;
            height: 131px;
        }
        .auto-style11 {
            width: 1210px;
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
                    <td class="auto-style5">
                        <span>מיקום</span>
                        </asp:xmldatasource><p>
                            <asp:DropDownList ID="ddlCities" runat="server" AutoPostBack="True" Height="23px" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged">
                            </asp:DropDownList>
                    </td>
                    <td class="auto-style6">
                        <span style="color: black;">רמת נקיות</span>

                        <div>
                            <asp:TextBox ID="clean" runat="server" OnTextChanged="clean_TextChanged"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style4">
                        <span>האם יש קבוצה </span>


                        <div>
                            <asp:TextBox ID="groupAns" runat="server" OnTextChanged="groupAns_TextChanged"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td></td>
                    <td align="left" rowspan="5" colspan="4" style="width: 50%">
                        <div id="map" style="width: 450px; height: 500px;"></div>
                    </td>
                    .<td>
                        <div id="wrapper">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <span>האם אתה רוצה להצטרף לקבוצה קיימת</span>

                        <div>
                            <asp:CheckBox ID="checkBoxJoinGroup" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" BorderColor="Red" />
                        </div>
                    </td>

                    <td class="auto-style6"><span>האם אתה רוצה ליצור קבוצה חדשה</span>

                        <div>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </div>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <span>ת.ז.</span>

                        <div>
                            <asp:TextBox ID="id" runat="server" BorderStyle="Double"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style6">
                        <span>שם</span>


                        <div>
                            <asp:TextBox ID="name" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style4"><span>משפחה
                    </span>
                        <div>
                            <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style7">
                        <span>מספר טלפון</span>

                        <div>
                            <asp:TextBox ID="phoneNumber" runat="server"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <br />
                        <span>תיאור</span>

                        <div>
                            <asp:TextBox ID="description" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style6">
                        <br />
                        <span>כתובת מייל</span>

                        <div>
                            <asp:TextBox ID="mailAddress" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style4">
                        <br />
                        <span>שם קבוצה</span>

                        <div>
                            <asp:TextBox ID="nameOfGroup" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style7">
                        <br />
                        <       <span>גודל מקסימלי של קבוצה </span>
                        <div>
                            <asp:TextBox ID="maxNumOfMemmbers" runat="server"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <br />
                        <br />

                        <div>
                            <asp:Button ID="buttomCreatGroupButton" BackColor="lightGreen" BorderColor="WhiteSmoke" runat="server" Text="לחץ ליצירת קבוצה" Width="220px" OnClick="creatGroupButton_Click" />
                        </div>
                    </td>
                    <td class="auto-style6">
                        <br />
                        <br />
                        <div>
                            <asp:Button ID="buttonJoinGroup" BackColor="lightGreen" BorderColor="WhiteSmoke" runat="server" Text="לחץ להצטרפות לקבוצה" Width="220px" OnClick="joinGroupButton_Click" />
                        </div>

                    </td>
                </tr>
            </table>
        </form>
    </div>
    </div>
    <table class="auto-style8">
        <tr>
            <td class="auto-style11"></td>

        </tr>
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>

        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style9">
                <img alt="" class="auto-style10" src="images/environment.png" /></td>
        </tr>
    </table>
</body>
</html>
