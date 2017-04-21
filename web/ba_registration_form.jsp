<%-- 
    Document   : student_dashboard
    Created on : Mar 1, 2017, 11:24:18 AM
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
        <h1 class="page-title">Applications Details</h1>
        <ol class="breadcrumb">
            <li><a href="student_dashboard.jsp">Dashboard</a></li>
            <li><a href="applications.jsp">Business Applications</a></li>
            <li class="active">Fill Applications</li>
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
                                            <br>Application for Registration - 2017</b></h3>
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
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="control-label" for="title"><b>01. Title</b></label>
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
                                            <input type="hidden" id="page_name" name="page_name" value="border_info" />
                                            <div class="form-group">
                                                <label class="control-label" for="name_with_initials"><b>02. Name with Initials</b></label>
                                                <input type="text" class="form-control uppercase" name="nameWithInitials" id="name_with_initials"
                                                       placeholder="Name with Initials" autocomplete="off" style="text-transform:uppercase"/>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <label class="control-label" for="permanent_address"><b>03. Permanent Address</b></label>
                                                <input type="text" class="form-control" name="permanentAddress" id="permanent_address"
                                                       placeholder="Permanent Address" autocomplete="off"/>
                                            </div>
                                            <br>    
                                            <div class="form-group">
                                                <label class="control-label" for="inputUserNameOne"><b>04. Postal Address</b></label>
                                                <input type="text" class="form-control" name="postalAddress" id="correspondence_address"
                                                       placeholder="Address for Correspondence" autocomplete="off"/>
                                            </div>
                                            <br>    

                                            <div class="row">

                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label" for="tel_home"><b>05. District</b></label>
                                                        <input type="text" class="form-control" id="tel_office" name="district"
                                                               placeholder="District" autocomplete="off" maxlength="15"/>
                                                        <%--<select class="form-control" id="district" name="district" onchange="getProvince(this);" >
                                                            <%  DistrictDAO ddao = new DistrictDAO();
                                                                ArrayList<District> districtList = new ArrayList<District>();
                                                                districtList = ddao.districtList();
                                                            %>
                                                            <option value="">Please Select</option>
                                                            <%
                                                                for (int i = 0; i < districtList.size(); i++) {
                                                            %>
                                                            <option value="<%= districtList.get(i).getDistrictId()%>"> <%= districtList.get(i).getDistrictName()%> </option>
                                                            <%
                                                                }
                                                           %>
                                                        </select>--%>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label" for="tel_office"><b>06.I Province</b></label>
                                                        <input type="text" class="form-control" id="province" name="province"
                                                               placeholder="Province" autocomplete="off"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label" for="tel_mobile"><b>06.II Postal Code</b></label>
                                                        <input type="text" class="form-control" id="postal_code" name="postalCode"
                                                               placeholder="Postal Code" autocomplete="off" maxlength="10" />
                                                    </div>
                                                </div>
                                            </div>   
                                            <br>      
                                            <label class="control-label" for="inputUserNameOne"><b>07. Telephone Number/s</b></label>
                                            <div class="row">

                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label" for="tel_home"><b>Home</b></label>
                                                        <input type="text" class="form-control" id="tel_home" name="telHome"
                                                               placeholder="Home" autocomplete="off" maxlength="15"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label" for="tel_office"><b>Office</b></label>
                                                        <input type="text" class="form-control" id="tel_office" name="telOffice"
                                                               placeholder="Office" autocomplete="off" maxlength="15"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label" for="tel_mobile"><b>Mobile</b></label>
                                                        <input type="text" class="form-control" id="tel_mobile" name="telMobile"
                                                               placeholder="Mobile" autocomplete="off" maxlength="15" />
                                                    </div>
                                                </div>
                                            </div>   
                                            <br>
                                            <div class="form-group">
                                                <label class="control-label" for="email"><b>08. E-mail Address</b></label>
                                                <input type="email" class="form-control" id="email" name="email" 
                                                       placeholder="E-mail Address" autocomplete="off"/>  
                                            </div>
                                            <br>    

                                            <div class="row">

                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="control-label"><b>09. Gender </b></label>
                                                        <input type="text" class="form-control" id="postal_code" name="gender"
                                                               placeholder="Gender" autocomplete="off" maxlength="15" />

                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="control-label"><b>10. Civil Status </b></label>
                                                        <input type="text" class="form-control" id="civil_status" name="civilStatus"
                                                               placeholder="Civil Status" autocomplete="off"/>    

                                                    </div>
                                                </div>

                                            </div>    
                                            <br>
                                            <div class="row">

                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label"><b>11. Date of Birth</b> (E.g.: 1990/12/27)</label>

                                                        <div class="input-group" id="dateOfBirth">
                                                            <span class="input-group-addon">
                                                                <i class="icon wb-calendar" aria-hidden="true"></i>
                                                            </span>
                                                            <input type="text" class="form-control" data-format="yyyy/mm/dd" data-plugin="datepicker"  name="dateOfBirth" id="date_of_birth" placeholder="YYYY/MM/DD">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label"><b>12. National Identity Card Number</b></label>
                                                        <input type="text" class="form-control" id="nic_no" name="nic" placeholder="National Identity Card Number"
                                                               autocomplete="off" maxlength="15"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label"><b>13. Nationality</b></label>
                                                        <input type="text" class="form-control" id="nationality" name="nationality" placeholder="Nationality" 
                                                               autocomplete="off"/>
                                                    </div>
                                                </div>

                                            </div>            

                                        </div>
                                        <!-- End Panel 1-->

                                        <!-- Start Panel 2-->
                                        <div class="wizard-pane" id="exampleBillingOne" role="tabpanel">
                                            <br>
                                            <label class="control-label" for="inputUserNameOne"><b>14. Performance at the G.C.E. (A/L) Examination</b></label>
                                            <div class="row">

                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="control-label" for="year_al">Year</label>
                                                        <input type="text" class="form-control" id="year_al" name="alYear"
                                                               placeholder="YYYY" autocomplete="off" maxlength="4"/>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="control-label" for="index_al">Index No</label>
                                                        <input type="text" class="form-control" id="index_al" name="alIndex"
                                                               placeholder="XXXXXXXX" autocomplete="off" maxlength="10"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <table class="editable-table table table-striped table-bordered" id="subject_list_al">
                                                        <thead>
                                                            <tr>
                                                                <th class="col-sm-6">Subject</th>
                                                                <th class="col-sm-2">Grade/Marks</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="alSubject"/>
                                                                <td><input type="text" class="form-control" id="alGrade"/>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="alSubject"/>
                                                                <td><input type="text" class="form-control" id="alGrade"/>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="alSubject"/>
                                                                <td><input type="text" class="form-control" id="alGrade"/>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="alSubject"/>
                                                                <td><input type="text" class="form-control" id="alGrade"/>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="alSubject" value="General English" readonly/>
                                                                <td><input type="text" class="form-control" id="alGrade"/>

                                                            </tr>
                                                            <tr>
                                                                <td><input type="text" class="form-control" id="alSubject" value="Common Genaral Test" readonly/>
                                                                <td><input type="text" class="form-control" id="alGrade"/>

                                                            </tr>
                                                        </tbody>

                                                    </table>   
                                                </div>
                                            </div>

                                            <div class="row">

                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="control-label" for="zscore"><b>Z Score/ Aggregate</b></label>
                                                        <input type="text" class="form-control" id="zscore" name="alZScore"
                                                               placeholder="" autocomplete="off" maxlength="6"/>
                                                    </div>
                                                </div>


                                            </div>                                      

                                            <div class="form-group">
                                                <label class="control-label"><b>15. Professional or other Qualifications Acquired</b></label>
                                                <textarea class="form-control" rows="2" id="professional_qualifications" style="resize: vertical" name="professionalQualifications"></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label"><b>16. English Literacy</b></label>
                                                <input type="text" class="form-control uppercase" name="englishLiteracy" id="name_with_initials"
                                                       placeholder="englishLiteracy" autocomplete="off"/>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label"><b>17. IT Literacy</b></label>
                                                <input type="text" class="form-control uppercase" name="itLiteracy" id="name_with_initials"
                                                       placeholder="englishLiteracy" autocomplete="off"/>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label"><b>18. Employment Status </b></label>
                                                <input type="text" class="form-control" id="zscore" name="employmentStatus"
                                                       placeholder="Employment Status" autocomplete="off"/> 


                                            </div>

                                            <label class="control-label" for="inputUserNameOne"><b>19. Details of payment of application processing fee</b></label><br>


                                            <div class="form-group inline">

                                                <label class="control-label" for="inputUserNameOne">Date of Payment</label>
                                                <div class="input-group" id="dateOfPayment">
                                                    <span class="input-group-addon">
                                                        <i class="icon wb-calendar" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" data-format="yyyy/mm/dd" data-plugin="datepicker"  name="dateOfPayment" id="date_of_payment" placeholder="YYYY/MM/DD"/>
                                                </div>

                                            </div><br>
                                            <div class="form-group inline">

                                                <label class="control-label" for="inputUserNameOne">Branch of the People's Bank</label>

                                                <input type="text" class="form-control" id="branch" name="bankBranch"
                                                       placeholder="Bank Branch" autocomplete="off"/>


                                            </div>   
                                            <br>    

                                            <div class="form-group">
                                                <label class="control-label"><b>20. Following Documents are Annexed.</b></label>
                                                <div class="input-group">
                                                    <%--
                                                        AttachmentDAO attdao = new AttachmentDAO();
                                                        ArrayList<Attachment> attachmentList = new ArrayList<Attachment>();
                                                        attachmentList = attdao.attachmentList();

                                                            for (int i = 0; i < attachmentList.size(); i++) {
                                                        %>
                                                        <div>
                                                            <div class="checkbox-custom checkbox-primary">
                                                                <input type="checkbox" id="inputFor<%= attachmentList.get(i).getId()%>" name="documents_annexed[]" value="<%= attachmentList.get(i).getId()%>" data-fv-field="documents_annexed[]">
                                                                <label id="labelFor<%= attachmentList.get(i).getId()%>" for="inputFor<%= attachmentList.get(i).getId()%>"><%= attachmentList.get(i).getAttachmentName()%></label>
                                                                
                                                            </div>
                                                        </div>
                                                        <%
                                                            }
                                                        %>
                                                    --%>
                                                </div>
                                                <%                                                    
                                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                                    Date date = new Date();
                                                %>

                                                <input type="hidden" class="form-control" id="appliedDate" value="<%=dateFormat.format(date)%>" name="appliedDate"/>


                                            </div>

                                            <%--
                                                SubjectsDAO subjectsDao = new SubjectsDAO();
                                                ArrayList<Subject> subjects100_0 = subjectsDao.listSubjects100_0();
                                                ArrayList<Subject> subjects100_1 = subjectsDao.listSubjects100_1();
                                                ArrayList<Subject> subjects100_2 = subjectsDao.listSubjects100_2();
                                                subjectsDao.close();
                                                request.setAttribute("subjects100_0", subjects100_0);
                                                request.setAttribute("subjects100_1", subjects100_1);
                                                request.setAttribute("subjects100_2", subjects100_2);
                                            --%>

                                            <br>
                                            <!--div class="row">
                                                <label class="control-label"><b>REGISTRATION FOR 100 LEVEL COURSES</b></label>

                                                <br>
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label">Basic Subjects</label>
                                                    <div class="input-group">
                                                        <table class="table table-striped table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>Id</th>
                                                                    <th>Code</th>
                                                                    <th>Name</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label">Supplementary Subject</label>
                                                    <div class="input-group">

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label">Other Subjects</label>
                                                    <div class="form-group">


                                                    </div>
                                                    <div class="form-group">

                                                    </div>
                                                    <div class="form-group">

                                                    </div>
                                                </div>
                                            </div-->
                                            <input type="hidden" name="id" class="input-sm"/>

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

