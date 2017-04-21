<%-- 
    Document   : side_navibar_admin
    Created on : Oct 5, 2016, 2:00:11 PM
    Author     : nuwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--Administrator side navigation table-->
<div class="site-menubar">
    <div class="site-menubar-body">
        <div>
            <div>
                <ul class="site-menu">
                    <!--li class="site-menu-category">General</li>
                    <li class="site-menu-item">
                        <a href="javascript:void(0)" data-slug="dashboard">
                            <i class="site-menu-icon wb-dashboard" aria-hidden="true"></i>
                            <span class="site-menu-title">Dashboard</span>
                            <div class="site-menu-badge">
                                <span class="badge badge-success">1</span>
                            </div>
                        </a-->

                    <li class="site-menu-item">
                        <a class="animsition-link" href="../CDCE/admin_dashboard.jsp" data-slug="dashboard-v1">
                            <i class="site-menu-icon wb-dashboard" aria-hidden="true"></i>
                            <span class="site-menu-title">Dashboard</span>
                        </a>
                    </li>

                    <li class="site-menu-item">
                        <!--a href="javascript:void(0)" data-slug="layout">
                            <i class="site-menu-icon wb-layout" aria-hidden="true"></i>
                            <span class="site-menu-title">Main Menu</span>
                            <span class="site-menu-arrow"></span>
                        </a-->
                        <a class="animsition-link" href="../CDCE/applications.jsp" data-slug="layout-headers">
                            <i class="site-menu-icon wb-layout" aria-hidden="true"></i>
                            <span class="site-menu-title">Applications</span>
                        </a>
                    </li>

                    <li class="site-menu-item has-sub">
                        <a href="javascript:void(0)" data-slug="pending">
                            <i class="site-menu-icon wb-loop" aria-hidden="true"></i>
                            <span class="site-menu-title">Pending Details</span>
                            <div class="site-menu-badge">
                                <span class="site-menu-arrow"></span>
                                <!--<span class="badge badge-success">2</span>-->
                            </div>
                        </a>
                        <ul class="site-menu-sub">
                            <li class="site-menu-item">
                                <a class="animsition-link" href="../CDCE/selection_test.jsp" data-slug="selectionTest">
                                    <i class="site-menu-icon " aria-hidden="true"></i>
                                    <span class="site-menu-title">Selection Test</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="../CDCE/interviews.jsp" data-slug="interiews">
                                    <i class="site-menu-icon " aria-hidden="true"></i>
                                    <span class="site-menu-title">Interviews</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="site-menu-item">
                        <a class="animsition-link" href="../CDCE/registration.jsp" data-slug="layout-headers">
                            <i class="site-menu-icon icon wb-pencil" aria-hidden="true"></i>
                            <span class="site-menu-title">Registration</span>
                        </a>
                    </li>
                    <li class="site-menu-item">
                        <a class="animsition-link" href="" data-slug="layout-bordered-header">
                            <i class="site-menu-icon wb-file" aria-hidden="true"></i>
                            <span class="site-menu-title">Examination</span>
                        </a>
                    </li>
                    <li class="site-menu-item">
                        <a class="animsition-link" href="" data-slug="layout-two-columns">
                            <i class="site-menu-icon icon wb-user-circle" aria-hidden="true"></i>
                            <span class="site-menu-title">Graduation</span>
                        </a>
                    </li>

                    <li class="site-menu-item">
                        <a class="animsition-link" href="../CDCE/payments.jsp" data-slug="layout-two-columns">
                            <i class="site-menu-icon icon wb-payment" aria-hidden="true"></i>
                            <span class="site-menu-title">Payments</span>
                        </a>
                    </li>
                   
                </ul>
                </li>

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
            <a href="../CDCE/calendar.jsp">
                <i class="icon wb-calendar"></i>
                <span>Calendar</span>
            </a>
        </li>

        <li>
            <a href="../CDCE/admin_dashboard.jsp">
                <i class="icon wb-dashboard"></i>
                <span>Dashboard</span>
            </a>
        </li>
    </ul>
</div>