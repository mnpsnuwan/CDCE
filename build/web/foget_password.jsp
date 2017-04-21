<%-- 
    Document   : foget_password
    Created on : Sep 28, 2016, 10:35:15 AM
    Author     : nuwan
--%>

<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>

<%--
    if (session.getAttribute("username") == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    };
--%>

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


        <!-- Page -->
        <link rel="stylesheet" href="assets/css/pages/forgot-password.css">

        <!-- Fonts -->
        <link rel="stylesheet" href="assets/fonts/web-icons/web-icons.min.css">
        <link rel="stylesheet" href="assets/fonts/brand-icons/brand-icons.min.css">
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>


        <!--[if lt IE 9]>
          <script src="../../assets/vendor/html5shiv/html5shiv.min.js"></script>
          <![endif]-->

        <!--[if lt IE 10]>
          <script src="../../assets/vendor/media-match/media.match.min.js"></script>
          <script src="../../assets/vendor/respond/respond.min.js"></script>
          <![endif]-->

        <!-- Scripts -->
        <script src="assets/vendor/modernizr/modernizr.js"></script>
        <script src="assets/vendor/breakpoints/breakpoints.js"></script>
        <script>
            Breakpoints();
        </script>
    </head>
    <body class="page-forgot-password layout-full">
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

                <h3 class="page-title">Forgot Your Password ?</h3>
                <p>Input your registered email to reset your password</p>

                <form id="FogetPassword" method="post" action="Password" style="margin-left:27px;">
                    <div class="form-group">
                        <label class="control-label" for="inputEmail"><b>Email</b></label>
                        <div class="input-group" id="inputUsername">
                            <span class="input-group-addon">
                                <i class="icon wb-envelope" aria-hidden="true"></i>
                            </span>
                            <input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="Your Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-warning btn-block">Reset Your Password</button>
                    </div>
                </form>
                <p style="color:#545453;">Have password already? Please go to <a href="login.jsp" style="color:#FF8C00;">Sign In</a></p>
                <footer class="page-copyright" style="color:#595959;text-align: center;" >
                    <p>University of Colombo</p>
                    <p>© 2016. All RIGHT RESERVED.</p>

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


        <script>
            (function (document, window, $) {
                'use strict';

                var Site = window.Site;
                $(document).ready(function () {
                    Site.run();
                });
                
                $('#FogetPassword').formValidation({
                    framework: 'bootstrap',
                    fields: {
                        inputEmail: {
                            validators: {
                                notEmpty: {
                                    message: 'This field is required'
                                }
                            }
                        }
                    }
                })
                .on('success.form.fv', function (e) {
                            // Reset the message element when the form is valid


//                    $('.summary-errors').html('');
//                        $.post('BAFormServlet', $('#BARegistrationForm').serialize(), function (rs) {
//                       
//                        //alert("Form submitted");
//
//                    }).done(function (data) {
//                   
//                        window.location = "download_pdf.jsp?id="+data;
//
//                    });
                        });
            })(document, window, jQuery);
        </script>

    </body>

</html>
