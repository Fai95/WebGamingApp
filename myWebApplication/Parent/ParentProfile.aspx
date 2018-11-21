<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParentProfile.aspx.cs" Inherits="myWebApplication.Parent.ParentProfile" %>

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
    <title>الملف الشخصي</title>
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
                    <%--   <li>
                        <span class="center">
                            <asp:LinkButton runat="server" CssClass="btn btn-danger center" OnClick="SignOut_Click">تسجيل الخروج</asp:LinkButton>
                        </span>
                    </li>--%>
                    <li id="contact_us" runat="server"><a href="#">تواصل معنا</a></li>
                    <li id="profile" class="active" runat="server"><a href="ParentProfile.aspx">الملف الشخصي</a></li>
                    <li id="main" runat="server"><a href="ChooseStudent.aspx">الصفحة الرئيسية</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div style="text-align: center; vertical-align: middle; font-family: Verdana; color: Blue; position: absolute; top: 50%; left: 50%; margin-left: -88px; font-size: small; background-color: #DADADA"
        id="dvProgress" runat="server">
        <img src="images/block-rotate-loading-gif.gif" style="vertical-align: middle" alt="Processing" />
    </div>
    <div id="center-page">
        <h2 class="col-xs-11" runat="server" id="hdr">الملف الشخصي</h2>
        <br />
        <form id="form1" runat="server" style="text-align: end">

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
            <label class="col-xs-11 space-vert">الهاتف الجوال</label>
            <div class="col-xs-11">
                <asp:LinkButton runat="server" ID="phLB" OnClick="PhLB_Click"></asp:LinkButton>
                <asp:TextBox ID="phTB" Visible="false" runat="server" Class="form-control" OnTextChanged="PhTB_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPH" Visible="false" CssClass="text-primary" runat="server" ErrorMessage="الرجاء ادخال الهاتف الجوال " ControlToValidate="phTB"></asp:RequiredFieldValidator>
                <asp:Button runat="server" ID="savePh" Visible="false" Class="btn btn-success space-vert" Text="حفظ" OnClick="SavePh_Click" />
                <asp:Button runat="server" ID="cancelPh" Visible="false" Class="btn btn-danger space-vert" Text="إلغاء" OnClick="CancelPh_Click" />
                <hr />
            </div>

            <label class="col-xs-11 space-vert">االبريد الإلكتروني</label>

            <div class="col-xs-11">
                <asp:Label ID="mail" runat="server"></asp:Label>
                <hr />
            </div>

            <div class="form-group space-vert">
                <div class="col-md-11">
                    <asp:LinkButton runat="server" CssClass="" ID="changePassBtn" OnClick="ChangePassBtn_Click">تغيير كلمة المرور</asp:LinkButton>
                </div>
            </div>

            <div class="col-xs-11" visible="false" runat="server" id="passwordChangeDiv">
                <label class="col-xs-11">كلمة المرور</label>
                <div class="col-xs-11">
                    <asp:TextBox ID="pass" runat="server" Class="form-control" OnTextChanged="Pass_TextChanged" TextMode="Password"></asp:TextBox>
                </div>

                <label class="col-xs-11">تأكيد كلمة المرور</label>
                <div class="col-xs-11">
                    <asp:TextBox ID="pass2" runat="server" Class="form-control" OnTextChanged="Pass2_TextChanged" TextMode="Password"></asp:TextBox>
                </div>
                <div class="col-xs-11 space-vert form-horizontal">
                    <asp:Button ID="passChangeButn" runat="server" Class="btn btn-success" OnClick="PassChangeButn_Click" Text="تغيير" />
                    <asp:Button runat="server" ID="PassCancel" Class="btn btn-danger space-vert" Text="إلغاء" OnClick="CancelPass_Click" />
                    <hr />
                </div>
            </div>
        </form>
    </div>
</body>
</html>
