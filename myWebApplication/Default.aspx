<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="myWebApplication.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>تسجيل الدخول</title>
    <link rel="stylesheet" type="text/css" href="Styles/Default.css" />
    <link rel="stylesheet" type="text/css" href="css/Custom-Cs.css" />
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"> </script>
    <script src="JScripts/alerts.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body onload="dvProgress.style.display = 'none';">
    <!-- Nav bar -->
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
<%--                    <li id="btnSignup" runat="server"><a href="Contact_us.aspx">تواصل معنا</a></li>--%>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">التسجيل<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="Parent/Register.aspx">ولي أمر</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="Specialist/spRegister.aspx">أخصائي</a></li>
                            <li role="separator" class="divider"></li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="Default.aspx">هيا نبدأ
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Nav bar -->

    <div style="text-align: center; vertical-align: middle; font-family: Verdana; color: Blue; position: absolute; top: 50%; left: 50%; margin-left: -88px; font-size: small; background-color: #DADADA"
        id="dvProgress" runat="server">
        <img src="images/block-rotate-loading-gif.gif" style="vertical-align: middle" alt="Processing" />
    </div>
    <div id="center-page">
        <h2 class="col-xs-11">تسجيل الدخول</h2>
        <br />
        <form id="loginDiv" runat="server" style="text-align: end">
            <label class="col-xs-11">اسم المستخدم</label>
            <div class="col-xs-11">
                <asp:TextBox ID="uname" runat="server" Class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال اسم المستخدم" ControlToValidate="uname"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">كلمة المرور</label>
            <div class="col-xs-11">
                <asp:TextBox ID="pass" runat="server" Class="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال كلمة المرور" ControlToValidate="pass"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xs-11 space-vert">
                <asp:LinkButton ID="Butn" runat="server" CssClass="btn btn-success" OnClick="Butn_Click" Text="دخول">
                </asp:LinkButton>
            </div>

            <div class="col-md-11 form-group space-vert">
                <asp:LinkButton runat="server" ID="forgotPassBtn" PostBackUrl="~/ResetPass.aspx">نسيت كلمة المرور</asp:LinkButton>
            </div>
            <asp:Label ID="msg" runat="server"></asp:Label>
            <hr class=" space-vert col-lg-11" />

            <h2 class="col-xs-11">تواصل معنا</h2>
            <br />

            <p runat="server" class="col-xs-11 space-vert">للتواصل على البريد الإلكتروني </p>
            <div class="col-xs-11">
                <asp:LinkButton ID="EmailLB" runat="server"></asp:LinkButton>
                <a href="#" runat="server" id="Email">
                    <label>cloudgamingapp@gmail.com</label>
                    <img src="../images/email (2).png" height="20" width="20" />
                </a>
                <hr />
            </div>
        </form>
    </div>
</body>
</html>
