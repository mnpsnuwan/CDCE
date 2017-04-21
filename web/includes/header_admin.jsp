<%-- 
    Document   : header_admin
    Created on : Oct 5, 2016, 2:09:46 PM
    Author     : nuwan
--%>
<!---->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html class="no-js before-run" lang="en">
    <head>
        <!--<meta http-equiv="refresh" content="30"/>Refresh whole pages in 30sec-->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="description" content="CDCE for Peradeniya University">
        <meta name="author" content="">

        <title>Centre for Distance & Continuing Education</title>
        <!--link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script-->

        <!--Form Validator CSS-->
        <link rel="stylesheet" href="assets/css/bootstrapValidator.css">

        <link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">
        <link rel="shortcut icon" href="assets/images/crest.png">

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

        <!-- Fonts -->
        <link rel="stylesheet" href="assets/fonts/web-icons/web-icons.min.css">
        <link rel="stylesheet" href="assets/fonts/brand-icons/brand-icons.min.css">
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>

        <!-- Plugin -->
        <link rel="stylesheet" href="assets/vendor/fullcalendar/fullcalendar.css">
        <link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/bootstrap-datepicker.css">
        <link rel="stylesheet" href="assets/vendor/bootstrap-touchspin/bootstrap-touchspin.css">
        <link rel="stylesheet" href="assets/vendor/jquery-selective/jquery-selective.css">

        <link rel="stylesheet" href="assets/vendor/datatables-bootstrap/dataTables.bootstrap.css">
        <link rel="stylesheet" href="assets/vendor/datatables-fixedheader/dataTables.fixedHeader.css">
        <link rel="stylesheet" href="assets/vendor/datatables-responsive/dataTables.responsive.css">

        <link rel="stylesheet" href="assets/vendor/editable-table/editable-table.css">

        <!-- Plugins For alerts -->
        <link rel="stylesheet" href="assets/vendor/bootstrap-sweetalert/sweet-alert.css">
        <link rel="stylesheet" href="assets/vendor/toastr/toastr.css">
        <link rel="stylesheet" href="assets/vendor/alertify-js/alertify.css">

        <!--Calender Page -->
        <link rel="stylesheet" href="assets/css/apps/calendar.css">

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

        <style>
            .relative{position:relative;}
            .absolute-text{position:absolute; bottom:0px; padding:10px; width:100%; text-align:center;}
        </style>

        <!--Form Validator JS-->
        <!--<script src="assets/js/bootstrap.min.js"></script>-->
        <script src="assets/js/jquery-1.10.2.min.js"></script>
        <script src="assets/js/bootstrapValidator.js"></script>
        
        <%--<link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">
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
        --%>

    </head>
    <body>
        <!DOCTYPE html>
    <!---->
    <!--Administrator header-->
    <nav class="site-navbar navbar navbar-default navbar-fixed-top navbar-mega" role="navigation">

        <div class="navbar-header" style="background-color:#DCDCDC">
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
            <div style="background-color:#DCDCDC" class="navbar-brand navbar-brand-center site-gridmenu-toggle" data-toggle="gridmenu"> 
                <img class="navbar-brand-logo" src="assets/images/crest.png" title="">
                <span class="navbar-brand-text" style="font-size: 16px; color:#942A2A">University of Peradeniya</span>
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
                    <li class="hidden-xs" id="toggleFullscreen">
                        <a class="icon icon-fullscreen" data-toggle="fullscreen" href="#" role="button">
                            <span class="sr-only">Toggle fullscreen</span>
                        </a>
                    </li>
                    <li class="hidden-float">
                        <a class="icon wb-search" data-toggle="collapse" href="#site-navbar-search" role="button">
                            <span class="sr-only">Toggle Search</span>
                        </a>
                    </li>

                </ul>
                <!-- End Navbar Toolbar -->

                <!-- Navbar Toolbar Right -->
                <ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">

                    <li class="dropdown">
                        <a class="navbar-avatar dropdown-toggle" data-toggle="dropdown" href="#"
                           data-animation="slide-bottom" role="button">
                            <span class="avatar avatar-online">
                                <img src="assets/portraits/5.jpg" alt="...">
                                <i></i>
                            </span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li role="presentation">
                                <a href="javascript:void(0)" role="menuitem"><i class="icon wb-user" aria-hidden="true"></i> Profile</a>
                            </li>

                            <li role="presentation">
                                <a href="javascript:void(0)" role="menuitem"><i class="icon wb-settings" aria-hidden="true"></i> Settings</a>
                            </li>
                            <li class="divider" role="presentation"></li>
                            <li role="presentation">
                                <a href="login.jsp" role="menuitem"><i class="icon wb-power" aria-hidden="true"></i> Logout</a>
                            </li>

                            <%--                            <li role="presentation">
                                                            <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
                                                                <i class="icon wb-power" aria-hidden="true"></i><a href="javascript:void(0)" role="menuitem">
                                                                    <input type="submit" value="Logout" /></a>
                                                            </form>
                                                        </li>
                            --%>

                        </ul>
                    </li>


                </ul>
                <!-- End Navbar Toolbar Right -->
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
    <!---->  

