<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestService.aspx.cs" Inherits="SanalMuze.TestService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/metisMenu.min.css" rel="stylesheet">
    <link href="../css/startmin.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <title>DEU</title>
</head>
<body>
    <form id="frm_textfrom" runat="server">
        <div>
            <div id="wrapper">
                <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="AdminDashboard.aspx">Admin Page</a>
                    </div>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- Mobil Menü  -->

                    <div class="navbar-default sidebar" role="navigation">
                        <div class="sidebar-nav navbar-collapse">
                            <ul class="nav" id="side-menu">
                                <li class="sidebar-search">
                                    <div class="input-group custom-search-form">
                                        <input type="text" class="form-control" placeholder="Search...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                </li>
                                <li>
                                    <a href="AdminDashboard.aspx"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                                </li>
                                <li class="active">
                                    <a href="#"><i class="fa fa-files-o fa-fw"></i>Content Management<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="ListMateriel.aspx">List Materiel</a>
                                        </li>
                                        <li>
                                            <a href="MaterielAdd.aspx">Add Material</a>
                                        </li>
                                       <%-- <li>
                                            <a href="#">Remove Material</a>
                                        </li>
                                        <li>
                                            <a href="#">Update Material</a>
                                        </li>--%>
                                        <li>
                                            <a href="TestService.aspx">Test Service</a>
                                        </li>

                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Sol Menü İçerik -->
                </nav>
                <!-- İcon -->
                <div id="page-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <br />
                                    <br />
                                    <div class="col-lg-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <font style="vertical-align: inherit;">
                                                    <font style="vertical-align: inherit;">
                                   Service Get Material Details
                                </font></font>
                                            </div>
                                            <!-- Başlık -->
                                            <div class="panel-body">
                                                <div class="table-responsive">
                                                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div id="dataTables-example_filter" class="dataTables_filter">
                                                                    <label>
                                                                        <font style="vertical-align: inherit;">
                                                                            <font style="vertical-align: inherit;">Arama:</font>
                                                                          </font>
                                                                    </label>

                                                                    <asp:TextBox Class="form-control input-sm" ID="txt_ara" runat="server"></asp:TextBox>
                                                                    &nbsp&nbsp
                                                                    <asp:Button ID="btn_search" class="btn btn-success" OnClick="btn_search_Click" runat="server" Text="Search" />
                                                                </div>
                                                                <!-- Tablo içi Arama -->
                                                                <br />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
                                                                    <thead>
                                                                        <tr role="row">
                                                                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Name</font></font></th>
                                                                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Type</font></font></th>
                                                                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Description</font></font></th>
                                                                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">WhoAdded</font></font></th>
                                                                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">AddedDate</font></font></th>
                                                                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">ImageFilePath</font></font></th>
                                                                            <%--<th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">IsActive</font></font></th>--%>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <asp:Repeater ID="rptTestService" runat="server">
                                                                            <ItemTemplate>
                                                                                <tr class="gradeA odd" role="row">
                                                                                    <td class="sorting_1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%#Eval("Name") %></font></font></td>
                                                                                    <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%#Eval("Type") %></font></font></td>
                                                                                    <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%#Eval("Description") %></font></font></td>
                                                                                    <td class="center"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%#Eval("WhoAdded") %></font></font></td>
                                                                                    <td class="center"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%#Eval("AddedDate") %></font></font></td>
                                                                                    <td class="center"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%#Eval("ImageFilePath") %></font></font></td>
                                                                                    <%--<td class="center"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%#Eval("IsActive") %></font></font></td>--%>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <!-- Tablo -->

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- İçerik -->
                    <script src="../js/jquery.min.js"></script>
                    <script src="../js/bootstrap.min.js"></script>
                    <script src="../js/metisMenu.min.js"></script>
                    <script src="../js/startmin.js"></script>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
