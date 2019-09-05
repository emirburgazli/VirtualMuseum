<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialGuncelle.aspx.cs" Inherits="SanalMuze.wepPages.MaterialGuncelle" %>

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
    <form id="frmMaterialUpdate" runat="server">
    
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
                </button><!-- Mobil Menü  -->

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
                                </div><!-- Search  -->
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

                                </ul> <!-- Kategoriler -->
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
     <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Update Material</h1>
                            <div class="col-lg-8">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Material Added Page
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-12">

                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <asp:TextBox class="form-control" ID="txt_name" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label>Type</label>
                                                    <asp:TextBox class="form-control" ID="txt_type" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label>Description</label>
                                                    <asp:TextBox class="form-control" ID="txt_description" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label>Who Added</label>
                                                    <asp:TextBox class="form-control" ID="txt_whoadded" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label>File input</label>
                                                    <asp:FileUpload ID="materialAddedFileUpload" runat="server" />
                                                </div>
                                                <asp:Button class="btn btn-default" ID="btn_save_material" OnClick="btn_save_material_Click" runat="server" Text="Save" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- İÇERİK -->
            </div>

              <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/metisMenu.min.js"></script>
        <script src="../js/startmin.js"></script>
            </form>
</body>
</html>
