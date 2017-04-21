<%-- 
    Document   : login
    Created on : Oct 3, 2016, 11:35:12 AM
    Author     : nuwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%-- session.invalidate(); --%>

<html class="no-js before-run" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="description" content="bootstrap admin template">
        <meta name="author" content="">

        <title>Centre for Distance & Continuing Education</title>

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
        <link rel="stylesheet" href="assets/vendor/formvalidation/formValidation.css">


        <!-- Page -->
        <link rel="stylesheet" href="assets/css/pages/login.css">

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
    </head>
    <body class="page-login layout-full">
        <!--[if lt IE 8]>
              <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
          <![endif]-->


        <!-- Page -->
        <div class="page animsition vertical-align text-center" data-animsition-in="fade-in"
             data-animsition-out="fade-out">
            <div class="page-content vertical-align-middle">
                <div class="brand">
                    <img class="brand-img" src="assets/images/crest.png" alt="..." style="height:200px;">
                    <h2 class="brand-text">Centre for Distance & Continuing Education</h2>
                    <h2 class="brand-text">University of Peradeniya</h2>

                </div>

                <form id="LoginForm" method="post" action="LoginServlet" style="margin-left:27px;">
                    <div class="form-group" style="text-align: left;">
                        <label class="control-label" for="inputName"><b>Username</b></label>
                        <div class="input-group" id="inputUsername">
                            <span class="input-group-addon">
                                <i class="icon wb-envelope" aria-hidden="true"></i>
                            </span>
                            <input type="text" class="form-control" id="inputUsername" name="inputUsername" placeholder="Username">
                        </div>
                    </div>

                    <div class="form-group" style="text-align: left;">
                        <label class="control-label" for="inputPassword"><b>Password</b></label>
                        <div class="input-group" id="inputPassword">
                            <span class="input-group-addon">
                                <i class="icon wb-lock" aria-hidden="true"></i>
                            </span>
                            <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password">
                            <!--p style="color:#545453;text-align: right;"> <a href="Password" style="color:#FF8C00;">Forgot password?</a></p-->
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <div class="checkbox-custom checkbox-inline pull-left">
                            <input type="checkbox" id="inputCheckbox" name="checkbox">
                            <label for="inputCheckbox">Remember me</label>
                        </div>
                        <a class="pull-right" style="color:#FF8C00;" href="foget_password.jsp">Forgot password?</a>
                    </div>

                    <button type="submit" class="btn btn-block btn-warning" id="login_button">Sign in</button>
                </form>
                <!--p style="color:#545453;">If you are not registered please <a href="register.jsp" style="color:#FF8C00;">Register</a></p-->
                <footer class="page-copyright" style="color:#595959;text-align: center;" >
                    <p>CENTRE FOR DISTANCE & CONTINUING EDUCATION © 2016.</p> 
                    <p>All RIGHT RESERVED.</p>
                    <p>Solution by <a href="http://ucsc.cmb.ac.lk/">UCSC</a></p>

                </footer>
            </div>
        </div>
        <!-- End Page -->


        <!-- Core  -->
        <script src="assets/vendor/jquery/jquery.js"></script>
        <script src="assets/vendor/bootstrap/bootstrap.js"></script>
        <script src="assets/vendor/animsition/jquery.animsition.js"></script>
        <script src="assets/vendor/asscroll/jquery-asScroll.js"></script>
        <script src="assets/vendor/mousewheel/jquery.mousewheel.js"></script>
        <script src="assets/vendor/asscrollable/jquery.asScrollable.all.js"></script>
        <script src="assets/vendor/ashoverscroll/jquery-asHoverScroll.js"></script>

        <!-- Plugins -->
        <script src="assets/vendor/switchery/switchery.min.js"></script>
        <script src="assets/vendor/intro-js/intro.js"></script>
        <script src="assets/vendor/screenfull/screenfull.js"></script>
        <script src="assets/vendor/slidepanel/jquery-slidePanel.js"></script>

        <script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

        <!-- Scripts -->
        <script src="assets/js/core.js"></script>
        <script src="assets/js/site.js"></script>

        <script src="assets/js/sections/menu.js"></script>
        <script src="assets/js/sections/menubar.js"></script>
        <script src="assets/js/sections/sidebar.js"></script>

        <script src="assets/js/configs/config-colors.js"></script>
        <script src="assets/js/configs/config-tour.js"></script>

        <script src="assets/js/components/asscrollable.js"></script>
        <script src="assets/js/components/animsition.js"></script>
        <script src="assets/js/components/slidepanel.js"></script>
        <script src="assets/js/components/switchery.js"></script>
        <script src="assets/js/components/jquery-placeholder.js"></script>
        <script src="assets/vendor/formvalidation/formValidation.min.js"></script>
        <script src="assets/vendor/formvalidation/framework/bootstrap.min.js"></script>
        <script src="assets/js/form_validation.js"></script>
        <script>
            (function (document, window, $) {
                'use strict';
                var Site = window.Site;
                $(document).ready(function () {
                    Site.run();
                });

                $('#LoginForm').formValidation({
                    framework: 'bootstrap',
                    fields: {
                        inputUsername: {
                            validators: {
                                notEmpty: {
                                    message: 'This field is required'
                                }
                            }
                        },
                        inputPassword: {
                            validators: {
                                notEmpty: {
                                    message: 'This field is required'
                                }
                            }
                        }
                    }
                });
            })(document, window, jQuery);
        </script>

    </body>

</html>