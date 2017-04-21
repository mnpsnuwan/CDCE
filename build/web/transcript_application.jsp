<%-- 
    Document   : transcript_application
    Created on : Mar 20, 2017, 11:55:51 AM
    Author     : nuwan
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.CDCE.Model.Title"%>
<%@page import="com.CDCE.DAOs.TitleDAO"%>
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

<%@page import="com.CDCE.DAOs.ALSubjectResultDAOs"%>
<%@page import="com.CDCE.Model.ALSubjectResult"%>
<%@page import="com.CDCE.Model.Applications"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CDCE.DAOs.ApplicationsDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="includes/header_admin.jsp" %>
<%@include file="includes/side_navibar_student.jsp" %>

<div class="page animsition">
    <div class="page-header">
        <h1 class="page-title">Application for an Academic Transcript</h1>
        <ol class="breadcrumb">
            <li><a href="student_dashboard.jsp">Dashboard</a></li>
            <li class="active">Application for Transcript</li>
        </ol>
    </div>

    <div class="page-content container-fluid">

        <div class="panel">

            <div class="panel-body">

                <div class="tab-content">
                    <br>
                    <div id="application" class="tab-pane fade in active">

                        <div class="row">
                            <div class="relative">
                                <img class="img-responsive" src="assets/images/peradeniya.png" alt="">
                                <!--<p class="absolute-text">Hey I am text on an Image. </p>-->
                                <div class="panel-heading absolute-text center-block">

                                    <h3 class="img-responsive panel-title"><b>CENTRE FOR DISTANCE & CONTINUING EDUCATION
                                            <br>Application for an Academic Transcript</b></h3>
                                </div>

                            </div>
                            <!--<img class="img-responsive" src="assets/images/peradeniya.png">-->
                            <div class="col-md-10 col-sm-offset-1">
                                <!-- Panel Wizard Form Container -->
                                <div class="panel" id="exampleWizardFormContainer">
                                    <!--                                    <div class="panel-heading" style="text-align: center;">
                                    
                                                                            <h3 class="panel-title"><b>Bachelor of Arts General(External) Degree Programme
                                                                                    <br>Application of Registration - 2016</b></h3>
                                                                        </div>-->

                                    <!-- Wizard Content -->

                                    <form class="wizard-content" id="application_view_form" name="application_form" method="post" action="">

                                        <!-- Start Panel 1-->
                                        <div class="wizard-pane active" role="tabpanel">
                                            <div class="form-group">
                                                <label class="control-label" for="registrationNo"><b>01. Registration No</b></label>
                                                <input type="text" class="form-control uppercase" name="registrationNo" id="registrationNo"
                                                       placeholder="Ex : AEF/2016/0001" autocomplete="off" style="text-transform:uppercase"/>
                                            </div>
                                            <br>
                                            <!--                                                <input type="hidden" name="program_id" id="program_id" value="1" />-->
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="control-label" for="title"><b>02. Title</b></label>
                                                        <!--<input type="text" class="form-control" id="title" name="title" 
                                                               placeholder="Title" autocomplete="off" value="<%--=applications.getTitle()--%>"/>-->
                                                        <select class="form-control" id="title" name="title">

                                                            <option value=""></option>

                                                            <c:forEach items="${tlist}"  var="tlist">                                
                                                                <option value="${tlist['label']}">${tlist['label']}</option> 
                                                            </c:forEach>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-9">
                                                    <div class="form-group">
                                                        <label class="control-label" for="full_name"><b>Full Name</b></label>
                                                        <input type="text" class="form-control uppercase" id="fullName" name="fullName" 
                                                               placeholder="Full Name" autocomplete="off" style="text-transform:uppercase"/>
                                                    </div>
                                                </div>
                                            </div>       
                                            
                                            <br>    
                                            <div class="form-group">
                                                <label class="control-label" for="postalAddress"><b>03. Postal Address</b></label>
                                                <input type="text" class="form-control" name="postalAddress" id="correspondence_address"
                                                       placeholder="Postal Address" autocomplete="off"/>
                                            </div>
                                            <br>    

                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <label class="control-label" for="postalAddress"><b>04. Particulars of Examinations Passed</b></label><br/>
                                                    <table class="editable-table table table-striped table-bordered" id="subject_list_al">
                                                        <thead>
                                                            <tr>
                                                                <th class="col-sm-5">Examination</th>
                                                                <th class="col-sm-2">Year</th>
                                                                <th class="col-sm-2">Index No</th>
                                                                <th class="col-sm-3">Subjects</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td><label>First Examination in Arts/Science</label></td>
                                                                <td><input type="text" class="form-control" id="year"/></td>
                                                                <td><input type="text" class="form-control" id="indexNo"/></td>
                                                                <td><input type="text" class="form-control" id="subjects"/><br/>
                                                                    <input type="text" class="form-control" id="subjects"/><br/>
                                                                    <input type="text" class="form-control" id="subjects"/>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td><label>General/Special Degree Examination in Arts/Science</label></td>
                                                                <td><input type="text" class="form-control" id="year"/></td>
                                                                <td><input type="text" class="form-control" id="indexNo"/></td>
                                                                <td><input type="text" class="form-control" id="subjects"/><br/>
                                                                    <input type="text" class="form-control" id="subjects"/><br/>
                                                                    <input type="text" class="form-control" id="subjects"/>
                                                                </td>

                                                            </tr>
                                                            
                                                        </tbody>

                                                    </table>   
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="postalAddress"><b>05. Postal Address</b></label>
                                                <input type="text" class="form-control" name="postalAddress" id="correspondence_address"
                                                       placeholder="Postal Address" autocomplete="off"/>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <%                                                    
                                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                                    Date date = new Date();
                                                %>

                                                <input type="hidden" class="form-control" id="appliedDate" value="<%=dateFormat.format(date)%>" name="appliedDate"/>
                                            </div>

                                            <br>
                                            
                                            <div class="updatebtn" style="text-align: center">
                                                <%--<a href="?reject" class="reject"><button value="<%=applications.getId()%>" type="button" value="<%=applications.getId()%>" style="background-color:#da4939" id="reject<%=applications.getId()%>" class="pull-left tooltip-dark btn-sm btn-icon btn-inverse" data-toggle="tooltip" data-original-title="Reject" data-trigger="focus / hover"><i class="grey-100 icon wb-close" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button></a>--%>
                                                <button style="width: 100px; height: 40px;" type="reset" class="btn-dark" name="reset">Reset</button>
                                                <button style="width: 100px; height: 40px;" type="submit" class="btn-warning" name="save">Save</button>
                                                <%--<a href="?accept" class="accept"><button value="<%=applications.getId()%>" type="button" style="background-color:#00cc66" id="accept<%=applications.getId()%>" class="pull-right tooltip-dark btn-sm btn-icon btn-inverse" data-toggle="tooltip" data-original-title="Accept" data-trigger="focus / hover"><i class="grey-100 icon wb-check" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button></a>--%>
                                            </div>

                                        </div>
                                        <!-- End Panel 2-->                          

                                    </form>
                                    <!-- Wizard Content -->
                                </div>
                            </div>
                            <!-- End Panel Wizard Form Container -->
                        </div>

                    </div>
                </div>
                <div id="qualifications" class="tab-pane fade">
                </div>

            </div>
        </div></div>
</div>
<%@include file="includes/footer_admin.jsp" %>


<script>

    function assignConfirmationToReject() {
        if (confirm("Application will be Rejected and can't undo this operation!. Do you want to Reject this Record ?")) {
            return true;
        } else
        {
            return false;
        }

    }
</script>

<script>
    $(document).ready(function () {
        $('.updatebtn').delegate('.update', 'click', function (e) {

            var confirm = assignConfirmationToAccept();
            if (confirm === true) {
                var Id = jQuery(this).find('input').val(); //getting input button value for accept button
                var decision = "update";

                $.ajax({url: 'ApplicationViewServlet?id=' + Id + '&decision=' + decision, success: function (data) {

                        $("?update").html(data);
                        window.location = "application_view.jsp";

                    }});
                // e.preventDefault();
            }
        });
    });
</script>

<script>
    (function (document, window, $) {
        'use strict';

        var Site = window.Site;
        $(document).ready(function () {
            Site.run();
        });
    })(document, window, jQuery);


    (function () {
        // set up formvalidation
        $('#application_view_form').formValidation({
            framework: 'bootstrap',
            fields: {
                fullName: {
                    validators: {
                        notEmpty: {
                            message: 'The name is required'
                        },
                        stringLength: {
                            min: 6,
                            max: 100,
                            message: 'The name must be more than 6 characters'
                        },
                        regexp: {
                            regexp: /^[A-Z\s]+$/i,
                            message: 'The full name can consist of alphabetical characters and spaces only'
                        }
                    }
                },
                nameWithInitials: {
                    validators: {
                        notEmpty: {
                            message: 'The name with initials is required'
                        },
                        stringLength: {
                            min: 4,
                            max: 80,
                            message: 'The name must be more than 4 characters'
                        },
                        regexp: {
                            regexp: /^[A-Z\s]+$/i,
                            message: 'The name with initials can consist of alphabetical characters and spaces only'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: 'The email is required'
                        },
                        regexp: {
                            regexp: /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/,
                            message: 'The input is not a valid email address'
                        }
                    }
                }

            }
        });

    })();

</script>

</body>
</html>


