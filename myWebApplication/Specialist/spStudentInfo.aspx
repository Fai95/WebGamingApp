<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="spStudentInfo.aspx.cs" Inherits="myWebApplication.Specialist.spStudentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="../Styles/Default.css" />
    <link rel="stylesheet" type="text/css" href="../css/Custom-Cs.css" />
    <link rel="stylesheet" type="text/css" href="../datepicker/css/datepicker.css" />

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>معلومات الطالب</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../JScripts/alerts.js"></script>
    <script src="../datepicker/js/bootstrap-datepicker.js"></script>
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="JScripts/alerts.js"></script>
</head>
<body onload="dvProgress.style.display = 'none';">
    <form id="form1" runat="server">
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
                        <li id="contact_us" runat="server"><a href="#">تواصل معنا</a></li>
                        <li class="active">
                                      <span class="center active">
     <asp:ImageButton runat="server" height="45" width="45"  ID="BarIcon" OnClick="BarIcon_Click" ImageUrl="#">
           
                            </asp:ImageButton>
                            </span>
                        </li>
                        <li id="main" class="active" runat="server"><a href="spChooseAstudent.aspx">الصفحة الرئيسية</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--NavBar-->

        <!-- Loading -->
        <div style="text-align: center; vertical-align: middle; font-family: Verdana; color: Blue; position: absolute; top: 50%; left: 50%; margin-left: -88px; font-size: small; background-color: #DADADA"
            id="dvProgress" runat="server">
            <img src="images/block-rotate-loading-gif.gif" style="vertical-align: middle" alt="Processing" />
        </div>
        <!-- Loading -->

        <div id="center-page">
            <h2 class="col-xs-11" id="hdr" runat="server">ملف الطالب</h2>
            <br />
            <div style="text-align: end">

                <div class="col-xs-11">
                    <img height="70" width="70" src="#" id="studImg" runat="server" />
                </div>

                <label class="col-xs-11 space-vert">رقم الملف</label>

                <div class="col-xs-11">
                    <asp:Label ID="studID" runat="server"></asp:Label>
                    <hr />
                </div>

                <label class="col-xs-11 space-vert">الاسم</label>
                <div class="col-xs-11">
                    <asp:Label ID="StudentName" runat="server"></asp:Label>
                    <hr />
                </div>

                <label class="col-xs-11 space-vert">العمر</label>

                <div class="col-xs-11">
                    <asp:Label ID="age" runat="server"></asp:Label>
                    <hr />
                </div>

                <label class="col-xs-11 space-vert">المركز</label>

                <div class="col-xs-11">
                    <asp:Label ID="StudCenter" runat="server"></asp:Label>
                    <hr />
                </div>

                <label class="col-xs-11 space-vert">الأخصائي</label>
                <div class="col-xs-11">
                    <asp:Label runat="server" ID="specName"></asp:Label>
                    <hr />
                </div>

                <label class="col-xs-11 space-vert">معلومات التواصل مع ولي الأمر</label>

                <div class="col-xs-11">
                    <label runat="server" class="col-xs-11 space-vert">الإسم</label>
                    <div class="col-xs-11">
                       <asp:Label ID="ParentName" runat="server"> اسم</asp:Label>
                       <hr />
                    </div>
                     <label runat="server" class="col-xs-11 space-vert">رقم الهاتف الجوال</label>
                    <div class="col-xs-11">
                       <asp:Label ID="ParentPhone" runat="server"></asp:Label>
                       <hr />
                    </div>
                     <label runat="server" class="col-xs-11 space-vert">البريد الإلكتروني</label>
                    <div class="col-xs-11">
                       <asp:LinkButton ID="ParentEmail" runat="server"></asp:LinkButton>
                        <a  href="#" runat="server" id="PEmail">
                            <img src="../images/email (2).png" height="20" width="20"/>
                        </a>
                       <hr />
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
