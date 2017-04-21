<%-- 
    Document   : user_add
    Created on : Jan 17, 2017, 12:37:33 PM
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

<%@page import="com.CDCE.Model.UserRole"%>
<%@page import="java.util.List"%>
<%@page import="com.CDCE.DAOs.UserRoleDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="includes/header_admin.jsp"%>
<%@include file="includes/side_navibar_sysadmin.jsp" %>

<div class="page">

    <div class="page-content">
        <div class="panel">
            <header class="panel-heading">
                <div class="panel-actions"></div>
                <h3 class="panel-title">Add a new User</h3>
            </header>
            <div class="panel-body">

                <form method="post" action="AddUser">
                    <div class="form-group">
                        <label class="sr-only" for="Username">Username</label>
                        <input type="text" class="form-control" id="inputUsername" name="username" placeholder="UserName">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="inputPassword">Password</label>
                        <input type="password" class="form-control" id="inputPassword" name="password"
                               placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="Username">Employment No.</label>
                        <input type="text" class="form-control" id="empNo" name="empNo" placeholder="Employment Number" readonly value="1">
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                        <select name="userRole" class="form-control col-md-3">
                            <%
                                UserRoleDAO roledao = new UserRoleDAO();
                                List<UserRole> roles = roledao.getAllRoles();
                                for (UserRole role : roles) {
                            %>
                            <option value="<%=role.getRoleId()%>"><%=role.getRoleName()%></option>
                            <%
                                }
                            %>
                        </select>
                        </div>
                        </div>
                        
                        <div class="col-md-9">
                            <div class="form-group">
                        <button type="submit" class="col-md-2 col-sm-offset-10 btn btn-primary">Add User</button>
                            </div>
                        </div>
                    </div>
                </form>


            </div>
        </div>

    </div>
</div>
<!-- End Page -->

<!-- Footer -->
<%@include file="includes/footer_admin.jsp" %>