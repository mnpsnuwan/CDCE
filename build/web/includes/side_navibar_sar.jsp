<%-- 
    Document   : side_navibar_sar
    Created on : Jan 19, 2017, 9:58:16 AM
    Author     : nuwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="site-menubar">
    <div class="site-menubar-body">
        <div>
            <div>
                <ul class="site-menu">
                    <li class="site-menu-item">
                        <a class="animsition-link" href="sar_dashboard.jsp" data-slug="dashboard-v1">
                            <i class="site-menu-icon wb-dashboard" aria-hidden="true"></i>
                            <span class="site-menu-title">Dashboard</span>
                        </a>
                    </li>

                    <li class="site-menu-item has-sub">
                        <a href="javascript:void(0)" data-slug="process">
                            <i class="site-menu-icon wb-loop" aria-hidden="true"></i>
                            <span class="site-menu-title">Student Details</span>
                            <div class="site-menu-badge">
                                <span class="site-menu-arrow"></span>
                                <!--<span class="badge badge-success">2</span>-->
                            </div>
                        </a>
                        <ul class="site-menu-sub">
                            <li class="site-menu-item">
                                <a class="animsition-link" href="" data-slug="graduationStudents">
                                    <i class="site-menu-icon " aria-hidden="true"></i>
                                    <span class="site-menu-title">Graduation Students</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="../CDCE/student.jsp" data-slug="Student">
                                    <i class="site-menu-icon " aria-hidden="true"></i>
                                    <span class="site-menu-title">Student</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="" data-slug="transcriptRequest">
                                    <i class="site-menu-icon " aria-hidden="true"></i>
                                    <span class="site-menu-title">Transcript Request</span>
                                </a>
                            </li>
                        </ul>
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
            <a href="../CDCE/sar_dashboard.jsp">
                <i class="icon wb-dashboard"></i>
                <span>Dashboard</span>
            </a>
        </li>
    </ul>
</div>