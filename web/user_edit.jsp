<%-- 
    Document   : user_edit
    Created on : Jan 17, 2017, 12:36:55 PM
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

<%@page import="com.CDCE.DAOs.UserRoleDAO"%>
<%@page import="com.CDCE.Model.UserRole"%>
<%@page import="java.util.List"%>
<%@page import="com.CDCE.Model.User"%>
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
                <h3 class="panel-title">Edit User</h3>
            </header>
            <div class="panel-body">
                <%                    if (request.getParameter("id") != null) {

                        String id = request.getParameter("id");
//                        System.out.println("userId " + id);
                        User user = new User(id);

//                        userId = user.getUserId();
//                        System.out.println("id " + userId);
%>

                <form method="post" action="UpdateUserServlet">
                    <div class="form-group">
                        <label class="sr-only" for="Username">Username</label>
                        <input type="text" class="form-control" id="inputUsername" name="inputUsername" placeholder="UserName" value="<%=user.getUsername()%>">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="Username">Employment Number</label>
                        <input type="text" class="form-control" id="empNo" name="empNo" placeholder="Employment Number" value="<%=user.getEmployee()%>" readonly>
                    </div>
                    <div class="form-group">
                        <select name="userRole" class="form-control">
                            <%
                                UserRoleDAO roledao = new UserRoleDAO();
                                List<UserRole> roles = roledao.getAllRoles();
                                for (UserRole role : roles) {
                            %>
                            <option value="<%=role.getRoleId()%>"><%=role.getRoleName()%></option>
                            <%--                            <option value="<%=role.getRoleId()%>"<%=(role.getRoleId().equals(user.getRoleName().getRoleId())) ? "selected" : ""%>><%=role.getRoleName()%></option>--%>

                            <%
                                }
                            %>
                        </select>
                    </div>
                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
                    <div class="col-md-2 col-sm-offset-10 btn-group" aria-label="Basic example" role="group">
                        <button type="submit" class="btn btn-warning btn-block">Update</button>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>

                </form>
                <%
                    }
                %>


                <form method="post" id="changePassword" action="ChangePassword">
                    <div class="form-group">
                        <label class="sr-only" for="inputPassword">Password</label>
                        <input type="password" class="form-control" id="inputPassword1" name="password1"
                               placeholder="Password">
                    </div>

                    <div class="form-group">
                        <label class="sr-only" for="inputPassword">Password (Confirm)</label>
                        <input type="password" class="form-control" id="inputPassword2" name="password2"
                               placeholder="Password (Confirm)" onkeyup="checkPass();
                                       return false;"/>
                            <p><small><span id="confirmMessage" class="confirmMessage"></span></small></p>
                    </div>
                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
                    <div class="col-md-2 col-sm-offset-10 btn-group" aria-label="Basic example" role="group">
                        <button type="submit" class="btn btn-success btn-block">Change Password</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

<!-- Footer -->
<%@include file="includes/footer_admin.jsp" %>

<script>
    $(document).ready(function () {
        $("#addProvince").on('change', function () {
//alert("Province Function OK");
            var provinceId = $("#addProvince").val();
//alert(value);
            var url = "districtLoader.jsp?provinceId=" + provinceId;
            $.ajax({url: url, success: function (data) {
//alert("SUCCESS OK");
                    $("#divDistrictDropDown").html(data);
//alert(data);
                }});
            $("#divDis").css({"display": "none"});

        });

    });

    (function () {
        // set up formvalidation
        $('#changePassword').formValidation({
            framework: 'bootstrap',
            fields: {
                password1: {
                    validators: {
                        notEmpty: {
                            message: 'The Password is required'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: 'The name must be more than 6 characters'
                        }
                    }
                },
                password2: {
                    validators: {
                        notEmpty: {
                            message: 'The Confirm Password is required'
                        }
                    }
                }
            }
        });

    })();

</script> 
<script>
    
    function checkPass()
        {
            //Store the password field objects into variables ...
            var inputPassword1 = document.getElementById('inputPassword1');
            var inputPassword2 = document.getElementById('inputPassword2');
            //Store the Confimation Message Object ...
            var message = document.getElementById('confirmMessage');
            //Set the colors we will be using ...
            var goodColor = "#66cc66";
            var badColor = "#ff6666";
            //Compare the values in the password field 
            //and the confirmation field
            if (inputPassword1.value === inputPassword2.value) {
                //The passwords match. 
                //Set the color to the good color and inform
                //the user that they have entered the correct password 
//                inputPassword2.style.backgroundColor = goodColor;
                message.style.color = goodColor;
                message.innerHTML = "Passwords Matched!";
            } else {
                //The passwords do not match.
                //Set the color to the bad color and
                //notify the user.
//                inputPassword2.style.backgroundColor = badColor;
                message.style.color = badColor;
                message.innerHTML = "Passwords Did Not Match!";
            }
        }
    
</script>