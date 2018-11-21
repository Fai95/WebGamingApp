<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="spRegister.aspx.cs" Inherits="myWebApplication.Specialist.spRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" type="text/css" href="../Styles/Default.css" />
    <link rel="stylesheet" type="text/css" href="../css/Custom-Cs.css" />

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>التسجيل</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../JScripts/alerts.js"></script>
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
</head>

<body onload="dvProgress.style.display = 'none';">
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
                    <li id="btnSignup" runat="server"><a href="#">تواصل معنا</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">التسجيل<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="Parent/Register.aspx">ولي أمر</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="Specialist/spRegister.aspx">أخصائي</a></li>
                            <li role="separator" class="divider"></li>
                        </ul>
                    </li>
                    <li style="background-color: lightblue">
                        <a href="../Default.aspx">هيا نبدأ
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div style="text-align: center; vertical-align: middle; font-family: Verdana; color: Blue; position: absolute; top: 50%; left: 50%; margin-left: -88px; font-size: small; background-color: #DADADA"
        id="dvProgress" runat="server">
        <img src="images/block-rotate-loading-gif.gif" style="vertical-align: middle" alt="Processing" />
    </div>
    <div id="center-page">
        <h2 class="col-xs-11">التسجيل</h2>
        <br />
        <asp:Label runat="server" ID="msg"></asp:Label>
        <form id="form1" runat="server" style="text-align: end">
            <label class="col-xs-11">الاسم الأول</label>
            <div class="col-xs-11">
                <asp:TextBox ID="fname" runat="server" Class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال الاسم الأول" ControlToValidate="fname"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">الاسم الأخير</label>
            <div class="col-xs-11">
                <asp:TextBox ID="lname" runat="server" Class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال الاسم الأخير" ControlToValidate="lname"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">الهاتف الجوال</label>
            <div class="col-xs-11">
                <asp:TextBox ID="ph" runat="server" Class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال الهاتف الجوال " ControlToValidate="ph"></asp:RequiredFieldValidator>
            </div>

  <%--          <label class="col-xs-11">المركز</label>
            <div class="col-xs-11">
                <asp:DropDownList ID="CenterDDL" AutoPostBack="true" runat="server" CssClass="dropdown-menu-left form-control" OnSelectedIndexChanged="CenterDDL_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" ErrorMessage="الرجاء اختيار المركز" ControlToValidate="CenterDDL"></asp:RequiredFieldValidator>
            </div>--%>

            <label class="col-xs-11">االبريد الإلكتروني</label>
            <div class="col-xs-11">
                <asp:TextBox ID="mail" runat="server" Class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال البريد الالكتروني " ControlToValidate="mail"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">كلمة المرور</label>
            <div class="col-xs-11">
                <asp:TextBox ID="pass" runat="server" Class="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال كلمة المرور " ControlToValidate="pass"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">تأكيد كلمة المرور</label>
            <div class="col-xs-11">
                <asp:TextBox ID="pass2" runat="server" Class="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="الرجاء تأكيد كلمة المرور " ControlToValidate="pass2"></asp:RequiredFieldValidator>
            </div>

            <div class="col-xs-11 space-vert">
                <asp:Button ID="btSignup" runat="server" Class="btn btn-success" OnClick="BtSignup_Click" Text="تسجيل" />
            </div>
        </form>
    </div>
</body>
</html>
