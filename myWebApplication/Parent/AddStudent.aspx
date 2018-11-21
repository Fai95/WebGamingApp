<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="myWebApplication.Parent.AddStudent" %>

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
    <title>اضافة طالب</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../datepicker/js/bootstrap-datepicker.js"></script>
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../JScripts/alerts.js"></script>
    <script>
        $(function () {
            $('.datepicker').datepicker();
        });
    </script>
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

                    <li id="Li1" runat="server" class="active"><a href="AddStudent.aspx">إضافة طالب</a></li>
                    <li id="btnSignup" runat="server"><a href="ChooseStudent.aspx">الصفحة الرئيسية</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div style="text-align: center; vertical-align: middle; font-family: Verdana; color: Blue; position: absolute; top: 50%; left: 50%; margin-left: -88px; font-size: small; background-color: #DADADA"
        id="dvProgress" runat="server">
        <img src="images/block-rotate-loading-gif.gif" style="vertical-align: middle" alt="Processing" />
    </div>

    <div id="center-page">
        <h2 class="col-xs-11">إضافة طالب</h2>
        <h4 runat="server" visible="true" id="msg"></h4>
        <br />

        <form id="form1" runat="server" style="text-align: end">

                <label class="col-xs-11">رقم الملف</label>
            <div class="col-xs-11">
                <asp:TextBox ID="studID" runat="server" Class="form-control" OnTextChanged="StudID_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال رقم الملف" ControlToValidate="studID"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">الاسم الأول</label>
            <div class="col-xs-11">
                <asp:TextBox ID="fname" runat="server" Class="form-control" OnTextChanged="Fname_TextChanged" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال الاسم الأول" ControlToValidate="fname"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">الاسم الأخير</label>
            <div class="col-xs-11">
                <asp:TextBox ID="lname" runat="server" Class="form-control" OnTextChanged="Lname_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال الاسم الأخير" ControlToValidate="lname"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11" runat="server">الجنس</label>
            <div class="col-xs-11 form-horizontal">
                <asp:RadioButtonList OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true" ID="genderList" CssClass="col-xs-11 form-horizontal"
                    runat="server" BorderStyle="none">
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="الرجاء اختيار الجنس" ControlToValidate="genderList"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">تاريخ الميلاد</label>
            <div class="col-xs-11">
                <asp:TextBox runat="server" ID="dob" Class="datepicker form-control" OnTextChanged="Dob_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="الرجاء ادخال تاريخ الميلاد " ControlToValidate="dob"></asp:RequiredFieldValidator>
            </div>

            <div class="col-xs-11 space-vert">
                <asp:Button ID="addStudBtn" runat="server" Class="btn btn-success" Text="إضافة" OnClick="AddStudBtn_Click" />
            </div>
        </form>
        </div>
</body>
</html>
