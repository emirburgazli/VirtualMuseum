<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="SanalMuze.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>DEU Material</title>
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet" />

</head>
<body>
    <form id="frm_main" runat="server">
        <div>
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="MainPage.aspx"><strong>DEU</strong> Bilgi İşlem</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <%--<li>
                                <a href="AdminDashboard.aspx">Admin Page</a>
                            </li>--%>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <asp:Repeater ID="rptMainList" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-4 text-center col-sm-6 col-xs-12">
                                        <div class="thumbnail product-box">
                                            <asp:Image ImageUrl='<%#Eval("ImageFilePath")%>' Height="262px" Width="100%" runat="server" />
                                            <div class="caption">
                                                <h3><%#Eval("Name") %></h3>
                                                <p>Type : <strong><%#Eval("Type") %></strong></p>
                                                <p>Description : <strong><%#Eval("Description") %></strong></p>
                                                <p>Who Added: <strong><%#Eval("WhoAdded") %></strong></p>
                                                <p>Added Date : <strong><%#Eval("AddedDate") %></strong></p>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>

            <style>
                footer {
                    position: fixed;
                    bottom: 0px;
                    left: 0px;
                    width: 100%;
                    height: 50px;
                    padding: 15px;
                    background-color: #000;
                }
            </style>
            <footer class="footer">
                <div class="col-md-12 end-box ">
                    &copy; 2019 | &nbsp; Dokuz Eylül Üniversitesi Rektörlük | &nbsp; www.bid.deu.edu.tr | &nbsp; Email us: info@bid.deu.edu.tr
                </div>
            </footer>
            <script src="../assets/js/jquery-1.10.2.js"></script>
            <script src="assets/js/bootstrap.js"></script>
            <script src="../assets/ItemSlider/js/modernizr.custom.63321.js"></script>
            <script src="../assets/ItemSlider/js/jquery.catslider.js"></script>
            <script>
                $(function () {
                    $('#mi-slider').catslider();
                });
            </script>
        </div>
    </form>
</body>
</html>
