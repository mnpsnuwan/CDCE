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
<%@include file="includes/side_navibar_admin.jsp" %>

<div class="page">

    <div class="page-content">
        <div class="panel">
            <header class="panel-heading">
                <div class="panel-actions"></div>
                <h3 class="panel-title">Add a new Payment</h3>
            </header>
            <div class="panel-body">

                <form method="post" action="AddPayment">
                    <div class="form-group">
                        <label for="payment_type">Payment Type</label>
                        <select class="form-control" name="payment_type" id="payment_type">
                            <option value="1">Application processing</option>
                            <option value="2">Registration</option>
                            <option value="3">Renewal Fee</option>
                            <option value="4">Examination (100 Level Course)</option>
                            <option value="5">Examination (200 Level Course)</option>
                            <option value="6">Examination (300 Level Course)</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="year">Year</label>
                        <input type="text" class="form-control" id="year" name="year"/>
                    </div>
                    <div class="form-group">
                        <label for="amount">Amount</label>
                        <input type="text" class="form-control" id="amount" name="amount">
                    </div>
                    <div class="row">
                        <div class="col-md-10">
                            <div class="form-group">
                        <button type="submit" class="col-md-2 col-sm-offset-10 btn btn-primary">Save</button>
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