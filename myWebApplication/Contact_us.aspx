<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact_us.aspx.cs" Inherits="myWebApplication.Contact_us" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>تواصل معنا</title>
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
                    <li id="btnSignup" runat="server" class="active"><a href="#">تواصل معنا</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">التسجيل<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="Parent/Register.aspx">ولي أمر</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="Specialist/spRegister.aspx">أخصائي</a></li>
                            <li role="separator" class="divider"></li>
                        </ul>
                    </li>
                    <li>
                        <a href="Default.aspx">هيا نبدأ
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Nav bar -->
    <!-- Loading -->
    <div style="text-align: center; vertical-align: middle; font-family: Verdana; color: Blue; position: absolute; top: 50%; left: 50%; margin-left: -88px; font-size: small; background-color: #DADADA"
        id="dvProgress" runat="server">
        <img src="images/block-rotate-loading-gif.gif" style="vertical-align: middle" alt="Processing" />
    </div>
    <!-- Loading -->

    <div id="center-page">
        <h2 class="col-xs-11">تواصل معنا</h2>
        <br />
        <form runat="server" style="text-align: end">

            <%--        <label class="col-xs-11">الإسم</label>
            <div class="col-xs-11">
                <asp:TextBox ID="name" runat="server" Class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال الاسم" ControlToValidate="name"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">البريد الإلكتروني</label>
            <div class="col-xs-11">
                <asp:TextBox ID="Mail" runat="server" Class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال البريد الإلكتروني" ControlToValidate="mail"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">عنوان الرسالة</label>
            <div class="col-xs-11">
                <asp:TextBox ID="subject" runat="server" Class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال عنوان الرسالة" ControlToValidate="subject"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">محتوى الرسالة</label>
            <div class="col-xs-11">
                <asp:TextBox ID="msgContent" runat="server" Class="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال محتوى الرسالة" ControlToValidate="msgContent"></asp:RequiredFieldValidator>
            </div>

            <div class="col-xs-11 space-vert">
                <asp:LinkButton ID="SendButn" runat="server" CssClass="btn btn-success" OnClick="SendButn_Click" Text="إرسال">

                </asp:LinkButton>

            </div>
            <br />
            <asp:Label runat="server" ID="lbl"></asp:Label>
            <br />
            <br />
            <br />--%>
            <p runat="server" class="col-xs-11 space-vert">للتواصل على البريد الإلكتروني </p>
            <div class="col-xs-11">
                <asp:LinkButton ID="EmailLB" runat="server"></asp:LinkButton>
                <a href="#" runat="server" id="Email">
                    <label>cloudgamingapp@gmail.com</label>
                    <img src="../images/email (2).png" height="20" width="20" />
                </a>
            </div>
        </form>
    </div>
</body>
</html>
