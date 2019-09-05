<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListMateriel.aspx.cs" Inherits="SanalMuze.Default2" %>

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
    <form id="frm_listMaterial" runat="server">
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
                                    <%--  <li>
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
            </nav>
            <div id="page-wrapper">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <h1 class="page-header">List Materials</h1>
                                <asp:Repeater ID="rptList" runat="server" OnItemCommand="rptList_ItemCommand">
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
                                                    <a runat="server" href='<%#Eval("ID","MaterialGuncelle.aspx?MatID={0}") %>' class="btn btn-success" id="lbl_update">Update</a>

                                                    <asp:LinkButton ID="lbl_delete" OnClick="lbl_delete_Click" runat="server" class="btn btn-success" CommandName="Sil" CommandArgument='<%#Eval("ID") %>'> <i aria-hidden="true"></i>Delete</asp:LinkButton>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/metisMenu.min.js"></script>
        <script src="../js/startmin.js"></script>
    </form>
</body>
</html>
