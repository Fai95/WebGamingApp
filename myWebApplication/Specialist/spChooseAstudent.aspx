<%@ Page Title="" Language="C#" MasterPageFile="~/Specialist/spChooseAstudent.Master" AutoEventWireup="true" CodeBehind="spChooseAstudent.aspx.cs" Inherits="myWebApplication.Specialist.spChooseAstudent1" %>

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
                    <li id="contact_us" runat="server"><a href="#">تواصل معنا</a></li>
                    <li id="studReg" runat="server"><a href="studentRegistration.aspx">تسجيل طالب</a></li>
                    <li id="profile" runat="server"><a href="SpecialistProfile.aspx">الملف الشخصي</a></li>
                    <li id="main" class="active" runat="server"><a href="spChooseAstudent.aspx">الصفحة الرئيسية</a></li>
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
                                <asp:Label ID="studID" runat="server" Text='<%#Eval("StudentID") %>' />
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:ListView>
        <br />
        <br />
    </div>
</asp:Content>
