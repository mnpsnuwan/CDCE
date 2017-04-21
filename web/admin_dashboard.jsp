<%-- 
    Document   : admin_dashboard
    Created on : Oct 4, 2016, 12:15:20 PM
    Author     : nuwan
--%>

<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>

<%
//    if (session.getAttribute("username") == null) {
//        request.getRequestDispatcher("login.jsp").forward(request, response);
//    };
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="includes/header_admin.jsp" %>
<div class="site-menubar">
    <div class="site-menubar-body">
        <div>
            <div>
                <ul class="site-menu">
                    <li class="site-menu-category">Dashboard</li>
                </ul>
            </div>
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

<div class="site-gridmenu">
    <ul>

        <li>
            <a href="calendar.jsp">
                <i class="icon wb-calendar"></i>
                <span>Calendar</span>
            </a>
        </li>

        <li>
            <a href="admin_dashboard.jsp">
                <i class="icon wb-dashboard"></i>
                <span>Dashboard</span>
            </a>
        </li>
    </ul>
</div>


<!-- Page -->


<div class="page">
    <div class="page-content">
        <h2>Admin <small>Dashboard</small></h2>


        <div class="page-content container-fluid">
            <div class="row">
                <!-- Example Panel With Icon for Application -->
                <a href="applications.jsp"><div class="col-lg-2 col-md-4 col-sm-4">
                        <!-- Example Panel With Footer -->
                        <div class="panel panel-bordered" align="center">
                            <div class="panel-body" align="center">
                                <h4></h4>
                                <!--code>.panel-footer</code--><img class="img-responsive" src="assets/images/application.png">
                            </div>
                            <div class="panel-footer" style="text-align:center">Applications</div>
                        </div>
                    </div></a>

                <!-- Example Panel With Icon for Selection Test -->
                <a href="selection_test.jsp"><div class="col-lg-2 col-md-4 col-sm-4">
                        <!-- Example Panel With Footer -->
                        <div class="panel panel-bordered" align="center">
                            <div class="panel-body">
                                <h4></h4>
                                <!--code>.panel-footer</code--><img class="img-responsive" src="assets/images/selection_test.png">
                            </div>
                            <div class="panel-footer" style="text-align:center">Selection Test</div>
                        </div>
                    </div></a>
                
                <!-- Example Panel With Icon for Interviews -->
                <a href="interviews.jsp"><div class="col-lg-2 col-md-4 col-sm-4">
                        <!-- Example Panel With Footer -->
                        <div class="panel panel-bordered" align="center">
                            <div class="panel-body">
                                <h4></h4>
                                <!--code>.panel-footer</code--><img class="img-responsive" src="assets/images/interview.png">
                            </div>
                            <div class="panel-footer" style="text-align:center">Interviews</div>
                            </div>
                    </div></a>

                <!-- Example Panel With Icon for Registration -->
                <a href="registration.jsp"><div class="col-lg-2 col-md-4 col-sm-4">
                        <!-- Example Panel With Footer -->
                        <div class="panel panel-bordered" align="center">
                            <div class="panel-body">
                                <h4></h4>
                                <!--code>.panel-footer</code--><img class="img-responsive" src="assets/images/registration.png">
                            </div>
                            <div class="panel-footer" style="text-align:center">Registration</div>
                            </div>
                    </div></a>

                <!-- Example Panel With Icon for Examination -->
                <a href="#"><div class="col-lg-2 col-md-4 col-sm-4">
                        <!-- Example Panel With Footer -->
                        <div class="panel panel-bordered" align="center">
                            <div class="panel-body">
                                <h4></h4>
                                <!--code>.panel-footer</code--><img class="img-responsive" src="assets/images/examination.png">
                            </div>
                            <div class="panel-footer" style="text-align:center">Examination</div>
                        </div>
                    </div></a>

                <!-- Example Panel With Icon for Graduation -->
                <a href="#"><div class="col-lg-2 col-md-4 col-sm-4">
                        <!-- Example Panel With Footer -->
                        <div class="panel panel-bordered" align="center">
                            <div class="panel-body">
                                <h4></h4>
                                <!--code>.panel-footer</code--><img class="img-responsive" src="assets/images/graduation.svg">
                            </div>
                            <div class="panel-footer" style="text-align:center">Graduation</div>
                        </div>
                    </div></a>
                
                <!-- Example Panel With Icon for Payment -->
                <a href="payments.jsp"><div class="col-lg-2 col-md-4 col-sm-4">
                        <!-- Example Panel With Footer -->
                        <div class="panel panel-bordered" align="center">
                            <div class="panel-body">
                                <h4></h4>
                                <!--code>.panel-footer</code--><img class="img-responsive" src="assets/images/payment.png">
                            </div>
                            <div class="panel-footer" style="text-align:center">Payments</div>
                        </div>
                    </div></a>
                
            </div>
        </div>
    </div>

</div>
<!-- End Page -->


<!-- Footer -->
<%@include file="includes/footer_admin.jsp"%>
<script>
    (function (document, window, $) {
        'use strict';

        var Site = window.Site;
        $(document).ready(function () {
            Site.run();
        });
    })(document, window, jQuery);
</script>

</body>
</html>
