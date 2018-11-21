<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="myWebApplication.Parent.StudentProfile" %>

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
    <title>الملف الطالب</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../JScripts/alerts.js"></script>
    <script src="../datepicker/js/bootstrap-datepicker.js"></script>
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="JScripts/alerts.js"></script>
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
                    <li id="contact_us" runat="server"><a href="../Contact_us.aspx">تواصل معنا</a></li>
                    <li class="active">
                        <span class="center active">
                            <img runat="server" height="45" width="45" id="icon" src="#" />
                        </span>
                    </li>
                    <li id="main" runat="server"><a href="../Parent/ChooseStudent.aspx">الصفحة الرئيسية</a>

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
        <h2 class="col-xs-11" id="hdr" runat="server">ملف الطالب</h2>
        <br />
        <form id="form1" runat="server" style="text-align: end">

            <div class="col-xs-11">
                <img height="70" width="70" src="#" id="studImg" runat="server" />
            </div>

            <label class="col-xs-11 space-vert">رقم الملف</label>

            <div class="col-xs-11">
                <asp:Label ID="studID" runat="server"></asp:Label>
                <hr />
            </div>

            <label class="col-xs-11 space-vert">الاسم الأول</label>
            <div class="col-xs-11">
                <asp:LinkButton runat="server" ID="fnameLB" OnClick="FnameEditLbl_Click"></asp:LinkButton>
                <asp:TextBox Visible="false" ID="fnameTB" runat="server" Class="form-control" OnTextChanged="Fname_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFname" Visible="false" CssClass="text-primary" runat="server" ErrorMessage="الرجاء ادخال الاسم الأول" ControlToValidate="fnameTB"></asp:RequiredFieldValidator>
                <asp:Button runat="server" ID="EditFnamebtn" Visible="false" Class="btn btn-success space-vert" Text="حفظ" OnClick="EditFname_Click" />
                <asp:Button runat="server" ID="cancelFname" Visible="false" Class="btn btn-danger space-vert" Text="إلغاء" OnClick="Cancel_Click" />
                <hr />
            </div>

            <label class="col-xs-11 space-vert">الاسم الأخير</label>
            <div class="col-xs-11">
                <asp:LinkButton runat="server" ID="lnameLB" OnClick="LnameEditLbl_Click"></asp:LinkButton>
                <asp:TextBox ID="lnameTB" Visible="false" runat="server" Class="form-control" OnTextChanged="LnameTB_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLname" Visible="false" CssClass="text-primary" runat="server" ErrorMessage="الرجاء ادخال الاسم الأخير" ControlToValidate="lnameTB"></asp:RequiredFieldValidator>
                <asp:Button runat="server" ID="saveLname" Visible="false" Class="btn btn-success space-vert" Text="حفظ" OnClick="SaveLname_Click" />
                <asp:Button runat="server" ID="cancelLname" Visible="false" Class="btn btn-danger space-vert" Text="إلغاء" OnClick="CancelLname_Click" />
                <hr />

            </div>
            <label class="col-xs-11 space-vert">تاريخ الميلاد</label>
            <div class="col-xs-11">
                <asp:LinkButton runat="server" ID="dobLB" OnClick="DobLB_Click"></asp:LinkButton>
                <asp:TextBox runat="server" ID="DobTB" Class="datepicker form-control" Visible="false" OnTextChanged="DobTB_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPH" Visible="false" CssClass="text-primary" runat="server" ErrorMessage="الرجاء ادخال تاريخ الميلاد " ControlToValidate="DobTB"></asp:RequiredFieldValidator>
                <asp:Button runat="server" ID="saveDob" Visible="false" Class="btn btn-success space-vert" Text="حفظ" OnClick="SaveDob_Click" />
                <asp:Button runat="server" ID="cancelDob" Visible="false" Class="btn btn-danger space-vert" Text="إلغاء" OnClick="CancelDob_Click" />
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

            <label class="col-xs-11 space-vert">معلومات الأخصائي</label>

            <div class="col-xs-11">
                <label runat="server" class="col-xs-11 space-vert">الإسم</label>
                <div class="col-xs-11">
                    <asp:Label ID="specName" runat="server"> اسم</asp:Label>
                    <hr />
                </div>
                <label runat="server" class="col-xs-11 space-vert">رقم الهاتف الجوال</label>
                <div class="col-xs-11">
                    <asp:Label ID="specPhone" runat="server"></asp:Label>
                    <hr />
                </div>
                <label runat="server" class="col-xs-11 space-vert">البريد الإلكتروني</label>
                <div class="col-xs-11">
                    <asp:LinkButton ID="SpEmailTxt" runat="server"></asp:LinkButton>
                    <a href="#" runat="server" id="spEmail">
                        <img src="../images/email (2).png" height="20" width="20" />
                    </a>
                    <hr />
                </div>
            </div>
            <div class="col-xs-11">
                <asp:Button runat="server" ID="DeleteStudent" Width="100" Class="btn btn-danger space-vert" Text="حذف الطالب" OnClick="DeleteStudent_Click" />
            </div>
            <br />
        </form>
    </div>
</body>
</html>
