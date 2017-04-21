<%-- 
    Document   : form
    Created on : Jun 7, 2016, 11:33:59 AM
    Author     : Udaya
--%>

<%@page import="com.CDCE.Model.SideMenu"%>
<%@page import="com.CDCE.DAOs.MenuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CDCE.DAOs.FormDAO"%>
<%@page import="com.CDCE.DAOs.UserDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js before-run" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="description" content="bootstrap admin template">
        <meta name="author" content="">

        <title>Centre for Distance & Continuing Education</title>

        <link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!--Form Validator CSS-->
        <link rel="stylesheet" href="assets/css/bootstrapValidator.css">
        
        
        <!-- Stylesheets -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap-extend.min.css">
        <link rel="stylesheet" href="assets/css/site.min.css">

        <link rel="stylesheet" href="assets/vendor/animsition/animsition.css">
        <link rel="stylesheet" href="assets/vendor/asscrollable/asScrollable.css">
        <link rel="stylesheet" href="assets/vendor/switchery/switchery.css">
        <link rel="stylesheet" href="assets/vendor/intro-js/introjs.css">
        <link rel="stylesheet" href="assets/vendor/slidepanel/slidePanel.css">
        <link rel="stylesheet" href="assets/vendor/flag-icon-css/flag-icon.css">
        <link rel="stylesheet" href="assets/vendor/bootstrap-select/bootstrap-select.css">
        <!-- Plugin -->
        <link rel="stylesheet" href="assets/vendor/chartist-js/chartist.css">
        <link rel="stylesheet" href="assets/vendor/jvectormap/jquery-jvectormap.css">
        <!-- Plugin -->
        <link rel="stylesheet" href="assets/vendor/datatables-bootstrap/dataTables.bootstrap.css">
        <link rel="stylesheet" href="assets/vendor/datatables-fixedheader/dataTables.fixedHeader.css">
        <link rel="stylesheet" href="assets/vendor/datatables-responsive/dataTables.responsive.css">

        <link rel="stylesheet" href="assets/vendor/editable-table/editable-table.css">
        
        <!-- Plugin -->
        <link rel="stylesheet" href="assets/vendor/jquery-wizard/jquery-wizard.css">
        <link rel="stylesheet" href="assets/vendor/formvalidation/formValidation.css">
        

        <!-- Page -->
        <link rel="stylesheet" href="assets/css/../fonts/weather-icons/weather-icons.css">
        <link rel="stylesheet" href="assets/css/dashboard/v1.css">

        <!-- Fonts -->
        <link rel="stylesheet" href="assets/fonts/web-icons/web-icons.min.css">
        <link rel="stylesheet" href="assets/fonts/brand-icons/brand-icons.min.css">
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>


        <!--[if lt IE 9]>
        <script src="assets/vendor/html5shiv/html5shiv.min.js"></script>
        <![endif]-->

        <!--[if lt IE 10]>
        <script src="assets/vendor/media-match/media.match.min.js"></script>
        <script src="assets/vendor/respond/respond.min.js"></script>
        <![endif]-->

        <!-- Scripts -->
        <script src="assets/vendor/modernizr/modernizr.js"></script>
        <script src="assets/vendor/breakpoints/breakpoints.js"></script>
        <script>
            Breakpoints();
        </script>
        
        <!--Form Validator JS-->
        <!--<script src="assets/js/bootstrap.min.js"></script>-->
        <script src="assets/js/jquery-1.10.2.min.js"></script>
        <script src="assets/js/bootstrapValidator.js"></script>

    </head>
    <body class="dashboard">
        <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
            your browser</a> to improve your experience.</p>
        <![endif]-->

        <nav class="site-navbar navbar navbar-default navbar-fixed-top navbar-mega" role="navigation">

            <div class="navbar-header">
                <button type="button" class="navbar-toggle hamburger hamburger-close navbar-toggle-left hided"
                        data-toggle="menubar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="hamburger-bar"></span>
                </button>
                <button type="button" class="navbar-toggle collapsed" data-target="#site-navbar-collapse"
                        data-toggle="collapse">
                    <i class="icon wb-more-horizontal" aria-hidden="true"></i>
                </button>
                <button type="button" class="navbar-toggle collapsed" data-target="#site-navbar-search"
                        data-toggle="collapse">
                    <span class="sr-only">Toggle Search</span>
                    <i class="icon wb-search" aria-hidden="true"></i>
                </button>
                <div class="navbar-brand navbar-brand-center">
                    <img class="navbar-brand-logo" src="assets/images/crest.png" title="Remark" >
                    <!--<span class="navbar-brand-text">Centre for Distance & Continuing Education</span>-->
                </div>
            </div>

            <div class="navbar-container container-fluid">
                <!-- Navbar Collapse -->
                <div class="collapse navbar-collapse navbar-collapse-toolbar" id="site-navbar-collapse">
                    <!-- Navbar Toolbar -->
                    <ul class="nav navbar-toolbar">
                        <li class="hidden-float" id="toggleMenubar">
                            <a data-toggle="menubar" href="#" role="button">
                                <i class="icon hamburger hamburger-arrow-left">
                                    <span class="sr-only">Toggle menubar</span>
                                    <span class="hamburger-bar"></span>
                                </i>
                            </a>
                        </li>

                    </ul>
                    <!-- End Navbar Toolbar -->

                   
                </div>
                <!-- End Navbar Collapse -->

                <!-- Site Navbar Seach -->
                <div class="collapse navbar-search-overlap" id="site-navbar-search">
                    <form role="search">
                        <div class="form-group">
                            <div class="input-search">
                                <i class="input-search-icon wb-search" aria-hidden="true"></i>
                                <input type="text" class="form-control" name="site-search" placeholder="Search...">
                                <button type="button" class="input-search-close icon wb-close" data-target="#site-navbar-search"
                                        data-toggle="collapse" aria-label="Close"></button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- End Site Navbar Seach -->
            </div>
        </nav>
        <div class="site-menubar">
            <div class="site-menubar-body">
                <div>
                    <%--<div>
                        <ul class="site-menu">
                            <li class="site-menu-category"></li>
                            <%
                            //out.println(session.getAttribute("UserRole"));
                            MenuDAO menu = new MenuDAO();
                            for(SideMenu item : menu.menuItemList(session.getAttribute("UserRole").toString())){
                            %>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="<%=item.getUrl()%>" data-slug="angular">
                                    <i class="site-menu-icon wb-dashboard" aria-hidden="true"></i>
                                    <span class="site-menu-title"><%=item.getButtonName()%></span>

                                </a>
                            </li>
                            <%
                            }
                            %>
                      </ul>


                    </div>--%>
                </div>
            </div>

            <div class="site-menubar-footer">
                <a href="javascript: void(0);" class="fold-show" data-placement="top" data-toggle="tooltip"
                   data-original-title="Settings">
                    <span class="icon wb-settings" aria-hidden="true"></span>
                </a>
                <a href="javascript: void(0);" data-placement="top" data-toggle="tooltip" data-original-title="Lock">
                    <span class="icon wb-eye-close" aria-hidden="true"></span>
                </a>
                <a href="LoginServlet" data-placement="top" data-toggle="tooltip" data-original-title="Logout">
                    <span class="icon wb-power" aria-hidden="true"></span>
                </a>
            </div>
        </div>
       