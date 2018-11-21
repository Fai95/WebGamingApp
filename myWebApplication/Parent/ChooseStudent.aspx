<%@ Page Title="" Language="C#" MasterPageFile="~/Parent/ChooseStudent.Master" AutoEventWireup="true" CodeBehind="ChooseStudent.aspx.cs" Inherits="myWebApplication.Parent.ChooseStudent1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Styles/ChooseStudentStyle.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/Default.css" />
    <link rel="stylesheet" type="text/css" href="../css/Custom-Cs.css" />

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>الرئيسية</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
        <script src="JScripts/alerts.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--NavBar-->
    <div class="navbar navbar-default navbar-fixed-top" style="background-color: #CCCCCC" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Default.aspx"><span>
                    <img alt="Logo" src="https://s3.amazonaws.com/cloudgamingmulitmediabucket/logo.png" height="30" /></span>Cloud Gaming site</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <span class="center">
                            <asp:LinkButton runat="server" CssClass="btn btn-danger" OnClick="SignOut_Click">تسجيل الخروج</asp:LinkButton>
                        </span>
                    </li>
                    <li id="contact_us" runat="server"><a href="../Contact_us.aspx">تواصل معنا</a></li>
                    <li id="profile" runat="server"><a href="ParentProfile.aspx">الملف الشخصي</a></li>
                    <li id="main" class="active" runat="server"><a href="ChooseStudent.aspx">الصفحة الرئيسية</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!--NavBar-->

    <br />
    <br />
    <div id="msgDiv" runat="server" visible="false">
        <asp:Label ID="msg" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <asp:Image runat="server" Height="400" Width="500" AlternateText="bcground" ImageUrl="https://s3.amazonaws.com/cloudgamingmulitmediabucket/visual+/Background2.png" />
    </div>
    <div id="center-page" class="studentsList">
        <br />
        <asp:ListView runat="server" ID="StudentsList" OnItemCommand="LstView_ItemCommand">
            <ItemTemplate>
                <table runat="server">
                    <tr style="float: right" runat="server" id="STableRow">
                        <td runat="server">
                            <asp:LinkButton  CommandName="View" runat="server" ID="ChooseStudBtn">
                                <img src="<%#Eval("icon") %>" height="70" width="70"/>
                                <h3 runat="server"><%#Eval("First_name") %> </h3>
                                <asp:Label ID="studID" runat="server" Text='<%#Eval("ID") %>' />
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:ListView>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="addBtn" Visible="false" OnClick="AddBtn_Click">
            <img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDUyIDUyIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MiA1MjsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSIxMjhweCIgaGVpZ2h0PSIxMjhweCI+CjxnPgoJPHBhdGggZD0iTTI2LDBDMTEuNjY0LDAsMCwxMS42NjMsMCwyNnMxMS42NjQsMjYsMjYsMjZzMjYtMTEuNjYzLDI2LTI2UzQwLjMzNiwwLDI2LDB6IE0yNiw1MEMxMi43NjcsNTAsMiwzOS4yMzMsMiwyNiAgIFMxMi43NjcsMiwyNiwyczI0LDEwLjc2NywyNCwyNFMzOS4yMzMsNTAsMjYsNTB6IiBmaWxsPSIjMDA2REYwIi8+Cgk8cGF0aCBkPSJNMzguNSwyNUgyN1YxNGMwLTAuNTUzLTAuNDQ4LTEtMS0xcy0xLDAuNDQ3LTEsMXYxMUgxMy41Yy0wLjU1MiwwLTEsMC40NDctMSwxczAuNDQ4LDEsMSwxSDI1djEyYzAsMC41NTMsMC40NDgsMSwxLDEgICBzMS0wLjQ0NywxLTFWMjdoMTEuNWMwLjU1MiwwLDEtMC40NDcsMS0xUzM5LjA1MiwyNSwzOC41LDI1eiIgZmlsbD0iIzAwNkRGMCIvPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=" alt="addBtnAlt" height="70" width="70"/>
        </asp:LinkButton>
    </div>
</asp:Content>
