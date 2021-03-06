<%-- 
    Document   : side_navibar_sysadmin
    Created on : Jan 19, 2017, 11:59:55 AM
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
                    <li class="site-menu-item">
                        <a class="animsition-link" href="../CDCE/sysadmin_dashboard.jsp" data-slug="dashboard-v1">
                            <i class="site-menu-icon wb-dashboard" aria-hidden="true"></i>
                            <span class="site-menu-title">Dashboard</span>
                        </a>
                    </li>

                    <li class="site-menu-item">
                        <a class="animsition-link" href="../CDCE/users.jsp" data-slug="layout-two-columns">
                            <i class="site-menu-icon icon wb-user" aria-hidden="true"></i>
                            <span class="site-menu-title">Users</span>
                        </a>
                    </li>

                    <li class="site-menu-item">
                        <a class="animsition-link" href="" data-slug="layout-two-columns">
                            <i class="site-menu-icon icon wb-payment" aria-hidden="true"></i>
                            <span class="site-menu-title">User Roles</span>
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
            <a href="">
                <i class="icon wb-calendar"></i>
                <span>Calendar</span>
            </a>
        </li>

        <li>
            <a href="../CDCE/sysadmin_dashboard.jsp">
                <i class="icon wb-dashboard"></i>
                <span>Dashboard</span>
            </a>
        </li>
    </ul>
</div>