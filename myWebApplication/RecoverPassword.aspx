<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="myWebApplication.RecoverPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Styles/Default.css" />
    <title>تغيير كلمة المرور</title>
      <link rel="stylesheet" type="text/css" href="css/Custom-Cs.css" />

     <!-- Required meta tags -->
 <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
   <script src="js/jquery-3.2.1.min.js"></script>
     <script src="js/bootstrap.min.js"> </script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
     <script> function alert() {
            swal({
                title: "تم",
                text: "تم تغيير كلمة المرور بنجاح",
                icon: "success",
                button: "موافق",
            });
         }
    </script>
</head>
<body onload="dvProgress.style.display = 'none';">
     <div class="navbar navbar-default navbar-fixed-top" style="background-color:#CCCCCC" role="navigation">
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
                         
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">التسجيل<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="Parent/Register.aspx" >ولي أمر</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="Specialist/spRegister.aspx">أخصائي</a></li>
                                    <li role="separator" class="divider"></li>
                                </ul>
                            </li>
                            <li id="btnSignup" runat="server"><a href="#">تواصل معنا</a></li>
                               <li style="background-color:aquamarine">
                                  <a href="Default.aspx" >هيا نبدأ
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
        <br />
    <!--Reset pass-->
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-horizontal" style="text-align:end">
                <h2 class="col-xs-11">تغيير كلمة المرور</h2>
                <br /><br /><br />
                 <div class="form-group">
                    <asp:Label ID="lblMsg" runat="server" CssClass="col-md-2 control-label" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
                    </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="newPass" CssClass="control-label col-md-11" Text="كلمة المرور الجديدة" Visible="False" ></asp:Label>
                    <div class="col-md-11">
                        <asp:TextBox runat="server" ID="newPassTB" CssClass="form-control" TextMode="Password" Visible="False"></asp:TextBox>
                    </div>
                </div>
                 <div class="form-group">
                    <asp:Label runat="server" ID="newPass1" CssClass="control-label col-md-11" Text="تأكيد كلمة المرور الجديدة" Visible="False" ></asp:Label>
                    <div class="col-md-11">
                        <asp:TextBox runat="server" ID="newPass1TB" CssClass="form-control" TextMode="Password" Visible="False"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-11">
                    <div class="col-md-6">
                        <asp:Button  runat="server" CssClass="btn btn-success" Text="تأكيد" ID="ResetBtn" Visible="False" OnClick="ResetBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!--Reset Pass-->
        </div>
</body>
</html>
