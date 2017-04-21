<%-- 
    Document   : ba_examination_form
    Created on : Mar 6, 2017, 1:27:45 PM
    Author     : nuwan
--%>

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
        <h1 class="page-title">Examination Application</h1>
        <ol class="breadcrumb">
            <li><a href="student_dashboard.jsp">Dashboard</a></li>
            <li class="active">Apply for Examination</li>
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

                                    <h3 class="img-responsive panel-title"><b>Bachelor of Arts General(External) Degree Programme
                                            <br>Application for Examination - 2017</b></h3>
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
                                            <br>
                                            <!--                                                <input type="hidden" name="program_id" id="program_id" value="1" />-->
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="control-label" for="registration_no"><b>01. Registration No</b></label>
                                                        <input type="text" class="form-control" id="registrationNo" name="registrationNo" 
                                                               placeholder="Ex: AEF/2016/0001" autocomplete="off"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="control-label" for="national_ID_no"><b>02. National ID No</b></label>
                                                        <input type="text" class="form-control" id="nationalIDNo" name="nationalIDNo" 
                                                               placeholder="National ID No" autocomplete="off"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>        
                                            <div class="form-group">
                                                <label class="control-label" for="name_with_initials"><b>03. Name with Initials</b></label>
                                                <input type="text" class="form-control" name="nameWithInitials" id="name_with_initials"
                                                       placeholder="Name with Initials"/>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label" for="name_in_full"><b>04. Name in Full</b></label>
                                                <input type="text" class="form-control" name="nameInFull" id="nameInFull"
                                                       placeholder="Full Name"/>
                                            </div>

                                            <br>
                                            <label class="control-label"><b>05. Particulars of Examination for which entry is sought</b></label>

                                            <div class="form-group">
                                                <label class="control-label" for="medium"><b>I. Medium</b></label>
                                                <input type="text" class="form-control" name="medium" id="medium"
                                                       placeholder="Medium" autocomplete="off"/>
                                            </div>
                                            <br>
                                            <label class="control-label" for="subjects"><b>II. Subjects</b></label>

                                            <div class="row">
                                                <div class="col-sm-10 col-sm-offset-1">
                                                    <table class="editable-table table table-striped table-bordered" id="subject_list">
                                                        <thead>
                                                            <tr>
                                                                <th class="col-sm-2">Subject Code</th>
                                                                <th class="col-sm-6">Subject</th>
                                                                <th class="col-sm-2">Medium</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="subjectCode"/></td>
                                                                <td><input type="text" class="form-control" id="subject"/></td>
                                                                <td><input type="text" class="form-control" id="medium"/></td>

                                                            </tr>
                                                        </tbody>

                                                    </table>   
                                                </div>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <label class="control-label" for="contact_no"><b>06. Contact Number</b></label>
                                                <input type="text" class="form-control" name="contactNo" id="contact_no"
                                                       placeholder="Contact Number" autocomplete="off"/>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <label class="control-label" for="permanent_address"><b>07. Permanent Address</b></label>
                                                <input type="text" class="form-control" name="permanentAddress" id="permanent_address"
                                                       placeholder="Permanent Address" autocomplete="off"/>
                                            </div>
                                            <br>    
                                            <label class="control-label"><b>08. Indicate the town(where exam centre will be established) accoding to your preference</b></label>
                                            <div class="row">

                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label" for="order1"><b>I. Town Preference Order 01</b></label>
                                                        <input type="text" class="form-control" id="order1" name="order1"
                                                               placeholder="Order 1" autocomplete="off" maxlength="15"/>

                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label" for="order2"><b>II. Town Preference Order 02</b></label>
                                                        <input type="text" class="form-control" id="order2" name="order2"
                                                               placeholder="Order 2" autocomplete="off"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label" for="order3"><b>III. Town Preference Order 03</b></label>
                                                        <input type="text" class="form-control" id="order3" name="order3"
                                                               placeholder="Order 3" autocomplete="off" maxlength="15" />
                                                    </div>
                                                </div>
                                            </div>   
                                            <br>      
                                            <label class="control-label"><b>09. Examination fees Payable to any Branch of People's Bank</b></label><br>
                                            <label class="control-label">&nbsp; &nbsp; &nbsp; &nbsp; - <b>People's Bank Account No of University of Peradeniya : <span style="font-size: 14px; color: #2E0000">057-1-001-4-1338036</span></b></label><br>
                                            <label class="control-label">&nbsp; &nbsp; &nbsp; &nbsp; - <b>Exam application processing fee.....1000/=*</b></label><br>
                                            <label class="control-label">&nbsp; &nbsp; &nbsp; &nbsp; - <b>Examination fee.............................10000/=</b></label>
                                            <br>
                                             
                                            <div class="form-group inline">

                                                <label class="control-label" for="dateOfPayment"><b>I. Date of Payment</b></label>
                                                <div class="input-group" id="dateOfPayment">
                                                    <span class="input-group-addon">
                                                        <i class="icon wb-calendar" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" data-format="yyyy/mm/dd" data-plugin="datepicker"  name="dateOfPayment" id="date_of_payment" placeholder="YYYY/MM/DD"/>
                                                </div>

                                            </div><br>
                                            <div class="form-group inline">

                                                <label class="control-label" for="bankBranch"><b>II. Branch of the People's Bank</b></label>

                                                <input type="text" class="form-control" id="branch" name="bankBranch"
                                                       placeholder="Bank Branch" autocomplete="off"/>


                                            </div>   
                                            <br>
                                            <div class="form-group">
                                                <label class="control-label" for="anyChanges"><b>10. If there are any changes please indicate in the cage below</b></label>
                                                <textarea class="form-control" rows="2" id="anyChanges" style="resize: vertical" name="anyChanges"></textarea>
                                            </div>
                                        </div>
                                        <!-- End Panel 1-->
                                        <br>
                                            
                                            <input type="hidden" name="id" class="input-sm"/>

                                            <div class="updatebtn" style="text-align: center">
                                                <%--<a href="?reject" class="reject"><button value="<%=applications.getId()%>" type="button" value="<%=applications.getId()%>" style="background-color:#da4939" id="reject<%=applications.getId()%>" class="pull-left tooltip-dark btn-sm btn-icon btn-inverse" data-toggle="tooltip" data-original-title="Reject" data-trigger="focus / hover"><i class="grey-100 icon wb-close" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button></a>--%>
                                                <button style="width: 100px; height: 40px;" type="reset" class="btn-dark" name="reset">Reset</button>
                                                <button style="width: 100px; height: 40px;" type="submit" class="btn-warning" name="save">Save</button>
                                                <%--<a href="?accept" class="accept"><button value="<%=applications.getId()%>" type="button" style="background-color:#00cc66" id="accept<%=applications.getId()%>" class="pull-right tooltip-dark btn-sm btn-icon btn-inverse" data-toggle="tooltip" data-original-title="Accept" data-trigger="focus / hover"><i class="grey-100 icon wb-check" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button></a>--%>
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

                //                    password: {
                //                        validators: {
                //                            notEmpty: {
                //                                message: 'The password is required'
                //                            },
                //                            different: {
                //                                field: 'username',
                //                                message: 'The password cannot be the same as username'
                //                            }
                //                        }
                //                    }
            }
        });

    })();

</script>

</body>
</html>

