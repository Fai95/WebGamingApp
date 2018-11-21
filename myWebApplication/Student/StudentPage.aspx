<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="myWebApplication.Student.StudentPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

                        <li id="contact_us" runat="server"><a href="../Contact_us.aspx">تواصل معنا</a></li>
                        <li class="active">
                            <span class="center">
                                <asp:ImageButton runat="server" Height="45" Width="45" ID="icn" OnClick="StudentProf" ImageUrl="#"></asp:ImageButton>
                            </span>
                        </li>
                        <li id="main" runat="server"><a href="../Parent/ChooseStudent.aspx">الصفحة الرئيسية</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <!--NavBar-->
        <div style="text-align: center; vertical-align: middle; font-family: Verdana; color: Blue; position: absolute; top: 50%; left: 50%; margin-left: -88px; font-size: small; background-color: #DADADA"
            id="dvProgress" runat="server">
            <img src="images/block-rotate-loading-gif.gif" style="vertical-align: middle" alt="Processing" />
        </div>
        <div class="center-page col-lg-12">
            <div class="col-lg-12 space-vert">
                <br />
                    <h2 class="col-xs-12">هيا نلعب</h2>
                </div>
            <br />
            <div class="table-responsive col-xs-12 space-vert">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="https://s3.amazonaws.com/cloudgamingmulitmediabucket/visual+/Recognation.png"
                                        CauseValidation="false" Height="100" Width="100"
                                        OnClientClick="document.location.href = '#play';return false" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="https://s3.amazonaws.com/cloudgamingmulitmediabucket/visual+/Recognizing.png"
                                        CauseValidation="false" Height="100" Width="100"
                                        OnClientClick="document.location.href = '#play';return false" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="https://s3.amazonaws.com/cloudgamingmulitmediabucket/visual+/Direction.png"
                                        CauseValidation="false" Height="100" Width="100"
                                        OnClientClick="document.location.href = '#play';return false" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="https://s3.amazonaws.com/cloudgamingmulitmediabucket/visual+/Attention.png"
                                        CauseValidation="false" Height="100" Width="100"
                                        OnClientClick="document.location.href = '#play';return false" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="https://s3.amazonaws.com/cloudgamingmulitmediabucket/visual+/closing.png"
                                        CauseValidation="false" Height="100" Width="100"
                                        OnClientClick="document.location.href = '#play';return false" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="https://s3.amazonaws.com/cloudgamingmulitmediabucket/visual+/Touch.png"
                                        CauseValidation="false" Height="100" Width="100"
                                        OnClientClick="document.location.href = '#play';return false" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="https://s3.amazonaws.com/cloudgamingmulitmediabucket/visual+/memorizing.png"
                                        CauseValidation="false" Height="100" Width="100"
                                        OnClientClick="document.location.href = '#play';return false" />
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
    </form>
</body>
</html>
