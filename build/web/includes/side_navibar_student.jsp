<%-- 
    Document   : side_navibar_student
    Created on : Mar 1, 2017, 12:16:03 PM
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
                        <a class="animsition-link" href="../CDCE/student_dashboard.jsp" data-slug="dashboard-v1">
                            <i class="site-menu-icon wb-dashboard" aria-hidden="true"></i>
                            <span class="site-menu-title">Dashboard</span>
                        </a>
                    </li>

                    <li class="site-menu-item">
                        <a class="animsition-link" href="../CDCE/ba_registration_form.jsp" data-slug="layout-two-columns">
                            <i class="site-menu-icon icon wb-pencil" aria-hidden="true"></i>
                            <span class="site-menu-title">Bachelor of Arts Registration Form</span>
                        </a>
                    </li>
                    <li class="site-menu-item">
                        <a class="animsition-link" href="../CDCE/ba_examination_form.jsp" data-slug="layout-two-columns">
                            <i class="site-menu-icon icon wb-edit" aria-hidden="true"></i>
                            <span class="site-menu-title">Examination Form</span>
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