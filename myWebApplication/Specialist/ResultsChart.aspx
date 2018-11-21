<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultsChart.aspx.cs" Inherits="myWebApplication.Specialist.ResultsChart" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

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
    <title>نتيجة الطالب</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />

</head>
<body onload="dvProgress.style.display = 'none';">
    <form runat="server">
        <!--NavBar-->
        <div class="navbar navbar-default navbar-fixed-top" style="background-color: #CCCCCC" role="navigation" id="#top">
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
     <asp:ImageButton runat="server" height="45" width="45"  ID="Sicon" OnClick="Sicon_Click" ImageUrl="#">
           
                            </asp:ImageButton>
                            </span>
                        </li>
                        <li id="main" runat="server"><a href="spChooseAstudent.aspx">الصفحة الرئيسية</a></li>
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

        <div id="form1" style="text-align: end" class="space-vert">
            <asp:Label runat="server" Visible="true" ID="msg"> msg</asp:Label>
            <div class="col-lg-1" style="float: left">
                <asp:Chart ID="Chart1" OnClick="Chart1_Click" Palette="Pastel" BackColor="#DADADA" Height="390" Width="390" RightToLeft="Yes" runat="server">
                    <Series>
                        <asp:Series Name="الدرجة" PostBackValue="#VALX" XValueMember="Lvl_ID" YValueMembers="Score">
                        </asp:Series>
                        <asp:Series Name="الزمن" PostBackValue="#VALX" XValueMember="Lvl_ID" YValueMembers="Time">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="اللعبة">
                            </AxisX>
                            <AxisY Title="النتيجة">
                            </AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="true" BackColor="Transparent" Name="Score" LegendStyle="Row" />
                    </Legends>
                </asp:Chart>
            </div>
            <div style="float: right">

                <div class="col-xs-11" style="height: 10px; width: 10px">
                    <asp:ImageButton ID="icn" runat="server"
                        CauseValidation="false" Height="100" Width="100"
                        OnClientClick="document.location.href = '#play';return false" />
                </div>

                <br />
                <br />
                <br />
                <br />

                <label class="col-xs-11 space-vert">رقم الملف</label>
                <div class="col-xs-11">
                    <asp:Label ID="studID" runat="server"></asp:Label>
                    <hr />
                </div>

                <label class="col-xs-11">الاسم</label>
                <div class="col-xs-11">
                    <asp:Label ID="studName" runat="server"></asp:Label>
                    <hr />
                </div>

                <label class="col-xs-11">العمر</label>
                <div class="col-xs-11">
                    <asp:Label ID="studAge" runat="server"></asp:Label>
                    <hr />
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <div class="col-lg-1 space-vert" style="float: left">
                <asp:LinkButton runat="server">
                    <asp:HyperLink runat="server" ID="ShowDetHL" Visible="false" Text="عرض التفاصيل" NavigateUrl="#Details"></asp:HyperLink>
                </asp:LinkButton>
                <asp:LinkButton runat="server" OnClick="AllDataLB_Click" ID="AllDataLB" Text="عرض الكل"></asp:LinkButton>
            </div>
            <div id="DateDDL_div" visible="false" runat="server">
                <label class="col-xs-11">التاريخ</label>
                <div class="col-xs-11">
                    <asp:DropDownList ID="DatesDDL" AutoPostBack="true" runat="server" CssClass="dropdown-menu-left form-control" OnSelectedIndexChanged="DatesDDL_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div id="Details" visible="false" runat="server">
                <div style="text-align: end">
                    <hr />
                    <br />

                    <h2 class="col-xs-11" id="msg1">تفاصيل نتيجة الطالب</h2>
                    <div class="col-xs-11">
                        <img height="70" width="70" src="#" id="StateImg" runat="server" />
                    </div>

                    <label class="col-xs-11 space-vert" runat="server">رقم الملف</label>

                    <div class="col-xs-11">
                        <asp:Label ID="studentID" runat="server"> hi</asp:Label>
                        <hr />
                    </div>

                    <label class="col-xs-11">الاسم</label>
                    <div class="col-xs-11">
                        <asp:Label ID="Sname" runat="server"></asp:Label>
                        <hr />
                    </div>

                    <label class="col-xs-11 space-vert">اسم اللعبه</label>
                    <div class="col-xs-11">
                        <asp:Label ID="lvl_name" runat="server"></asp:Label>
                        <hr />
                    </div>

                    <label class="col-xs-11 space-vert">الدرجة</label>

                    <div class="col-xs-11">
                        <asp:Label ID="score" runat="server"></asp:Label>
                        <hr />
                    </div>

                    <label class="col-xs-11 space-vert">الزمن</label>

                    <div class="col-xs-11">
                        <asp:Label ID="time" runat="server"></asp:Label>
                        <hr />
                    </div>

                    <label class="col-xs-11 space-vert">التاريخ</label>
                    <div class="col-xs-11">
                        <asp:Label runat="server" ID="playDate"></asp:Label>
                        <hr />
                    </div>

                    <label class="col-xs-11 space-vert">عدد الأخطاء</label>
                    <div class="col-xs-11">
                        <asp:Label runat="server" ID="TriesNum"></asp:Label>
                        <hr />
                    </div>

                    <label class="col-xs-11 space-vert">عدد مرات سماع السؤال</label>
                    <div class="col-xs-11">
                        <asp:Label runat="server" ID="questionReplay"></asp:Label>
                        <hr />
                    </div>
                    <div>
                        <asp:HyperLink CssClass="col-xs-11" runat="server" ID="HyperLink1" Text="الرجوع" NavigateUrl="#top"></asp:HyperLink>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div id="play" runat="server">
                <hr />
                <div class="col-lg-11 space-vert">
                    <h2 class="col-xs-11">هيا نلعب</h2>
                </div>
                <div class="table-responsive col-xs-11">
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
            <asp:HyperLink CssClass="col-xs-11" runat="server" ID="HyperLink2" Text="الرجوع" NavigateUrl="#top"></asp:HyperLink>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
