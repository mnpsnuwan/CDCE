<%-- 
    Document   : student_view
    Created on : Jan 27, 2017, 12:18:40 PM
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

<%@page import="com.CDCE.Model.ALSubjectResult"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CDCE.DAOs.ALSubjectResultDAOs"%>
<%@page import="com.CDCE.Model.Applications"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="includes/header_admin.jsp" %>
<%@include file="includes/side_navibar_sar.jsp" %>

<div class="page">
    <div class="page-header">
        <h1 class="page-title">Student Details</h1>
        <ol class="breadcrumb">
            <li><a href="sar_dashboard.jsp">Dashboard</a></li>
            <li><a href="student.jsp">Students</a></li>
            <li class="active">View Students</li>
        </ol>
    </div>

    <div class="page-content">

        <div class="panel">

            <div class="panel-body">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#studentInfo">Student Information</a></li>
                    <li><a data-toggle="tab" href="#studentResult">Student Result</a></li>
                </ul>

                <div class="tab-content">
                    <br>
                    <div id="studentInfo" class="tab-pane fade in active">

                        <div class="row">
                            <div class="relative">
                                <img class="img-responsive" src="assets/images/peradeniya.png" alt="">
                                <!--<p class="absolute-text">Hey I am text on an Image. </p>-->
                                <div class="panel-heading absolute-text center-block">

                                    <h3 class="img-responsive panel-title"><b>Bachelor of Arts General(External) Degree Programme
                                            <br>Application of Registration - 2017</b></h3>
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
                                    <div class="panel-body">


                                        <%    int id = 0;

                                            if (request.getParameter("action").equals("edit") && request.getParameter("id") != null) {
                                                String suid = request.getParameter("id"); //Get id and assigning into suid
                                                Applications applications = new Applications(Integer.parseInt(suid));

                                                id = applications.getId();

                                        %>

                                        <!-- Wizard Content -->

                                        <form class="wizard-content" id="application_view_form" name="application_view_form">

                                            <!-- Start Panel 1-->
                                            <div class="wizard-pane active" role="tabpanel">
                                                <br>
                                                <!--                                                <input type="hidden" name="program_id" id="program_id" value="1" />-->
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label class="control-label" for="title"><b>01. Title</b></label>
                                                            <input type="text" class="form-control" id="title" name="title" 
                                                                   placeholder="Title" autocomplete="off" value="<%=applications.getTitle()%>" readonly/>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <div class="form-group">
                                                            <label class="control-label" for="full_name"><b>Full Name</b></label>
                                                            <input type="text" class="form-control uppercase" id="fullName" name="fullName" 
                                                                   placeholder="Full Name" autocomplete="off" value="<%= applications.getFullName()%>" readonly/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>        
                                                <input type="hidden" id="page_name" name="page_name" value="border_info" />
                                                <div class="form-group">
                                                    <label class="control-label" for="name_with_initials"><b>02. Name with Initials</b></label>
                                                    <input type="text" class="form-control uppercase" name="nameWithInitials" id="name_with_initials"
                                                           placeholder="Name with Initials" autocomplete="off" value="<%= applications.getNameWithInitials()%>" readonly/>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label" for="permanent_address"><b>03. Permanent Address</b></label>
                                                    <input type="text" class="form-control" name="permanentAddress" id="permanent_address"
                                                           placeholder="Permanent Address" autocomplete="off" value="<%= applications.getPermanentAddress()%>" readonly/>
                                                </div>
                                                <br>    
                                                <div class="form-group">
                                                    <label class="control-label" for="inputUserNameOne"><b>04. Postal Address</b></label>
                                                    <input type="text" class="form-control" name="postalAddress" id="correspondence_address"
                                                           placeholder="Address for Correspondence" autocomplete="off" value="<%= applications.getPostalAddress()%>" readonly/>
                                                </div>
                                                <br>    

                                                <div class="row">

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="tel_home"><b>05. District</b></label>
                                                            <input type="text" class="form-control" id="tel_office" name="district"
                                                                   placeholder="District" autocomplete="off" value="<%= applications.getDistrict()%>" maxlength="15" readonly/>

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="tel_office"><b>06.I Province</b></label>
                                                            <input type="text" class="form-control" id="province" name="province"
                                                                   placeholder="Province" autocomplete="off" value="<%= applications.getProvince()%>" readonly/>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="tel_mobile"><b>06.II Postal Code</b></label>
                                                            <input type="text" class="form-control" id="postal_code" name="postalCode"
                                                                   placeholder="Postal Code" autocomplete="off" value="<%= applications.getPostalCode()%>" maxlength="10" readonly/>
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
                                                                   placeholder="Home" autocomplete="off" value="<%= applications.getTelHome()%>" maxlength="15" readonly/>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="tel_office"><b>Office</b></label>
                                                            <input type="text" class="form-control" id="tel_office" name="telOffice"
                                                                   placeholder="Office" autocomplete="off" value="<%= applications.getTelOffice()%>" maxlength="15" readonly/>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="tel_mobile"><b>Mobile</b></label>
                                                            <input type="text" class="form-control" id="tel_mobile" name="telMobile"
                                                                   placeholder="Mobile" autocomplete="off" value="<%= applications.getTelMobile()%>" maxlength="15" readonly/>
                                                        </div>
                                                    </div>
                                                </div>   
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label" for="email"><b>08. E-mail Address</b></label>
                                                    <input type="email" class="form-control" id="email" name="email" 
                                                           placeholder="E-mail Address" autocomplete="off" value="<%= applications.getEmail()%>" readonly/>  
                                                </div>
                                                <br>    

                                                <div class="row">

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label"><b>09. Gender </b></label>
                                                            <input type="text" class="form-control" id="postal_code" name="gender"
                                                                   placeholder="Gender" autocomplete="off" value="<%= applications.getGender()%>" maxlength="15" readonly/>

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label"><b>10. Civil Status </b></label>
                                                            <input type="text" class="form-control" id="civil_status" name="civilStatus"
                                                                   placeholder="Civil Status" autocomplete="off" value="<%= applications.getCivilStatus()%>" readonly/>    

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
                                                                <input type="text" class="form-control" data-format="yyyy/mm/dd" data-plugin="datepicker"  name="dateOfBirth" id="date_of_birth" value="<%= applications.getDateOfBirth()%>" placeholder="YYYY/MM/DD" readonly/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label"><b>12. National Identity Card Number</b></label>
                                                            <input type="text" class="form-control" id="nic_no" name="nic" placeholder="National Identity Card Number"
                                                                   autocomplete="off" value="<%= applications.getNic()%>" maxlength="15" readonly/>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label"><b>13. Nationality</b></label>
                                                            <input type="text" class="form-control" id="nationality" name="nationality" placeholder="Nationality" 
                                                                   autocomplete="off"  value="<%= applications.getNationality()%>" readonly/>
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

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="year_al">Year(YYYY)</label>
                                                            <input type="text" class="form-control" id="year_al" name="alYear"
                                                                   placeholder="" autocomplete="off" maxlength="4" value="<%= applications.getAlYear()%>" readonly/>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="index_al">Index No</label>
                                                            <input type="text" class="form-control" id="index_al" name="alIndex"
                                                                   placeholder="" autocomplete="off" maxlength="10" value="<%= applications.getAlIndex()%>" readonly/>
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

                                                                <%
                                                                    ALSubjectResultDAOs subdao = new ALSubjectResultDAOs();
                                                                    ArrayList<ALSubjectResult> alSubjectList = new ArrayList<ALSubjectResult>();
                                                                    alSubjectList = subdao.alSubjectList(Integer.parseInt(suid));

                                                                    for (int i = 0; i < alSubjectList.size(); i++) {

                                                                %>
                                                                <tr>
                                                                    <td><input type="text" class="form-control" id="alGrade" value="<%= alSubjectList.get(i).getSubject()%>" disabled/>
                                                                    <td><input type="text" class="form-control" value="<%= alSubjectList.get(i).getGrade()%>" readonly/>

                                                                </tr>
                                                                <%
                                                                    }
                                                                %>
                                                            </tbody>

                                                        </table>   
                                                    </div>
                                                </div>    

                                                <div class="row">

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="zscore"><b>Z Score/ Aggregate</b></label>
                                                            <input type="text" class="form-control" id="zscore" name="alZScore"
                                                                   placeholder="" autocomplete="off" maxlength="6" value="<%= applications.getAlZScore()%>" readonly/>
                                                        </div>
                                                    </div>


                                                </div>                                      

                                                <div class="form-group">
                                                    <label class="control-label"><b>15. Professional or other Qualifications Acquired</b></label>
                                                    <textarea class="form-control" rows="2" id="professional_qualifications" style="resize: vertical" name="professionalQualifications" readonly><%= applications.getProfessionalQualifications()%></textarea>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label"><b>16. English Literacy</b></label>
                                                    <input type="text" class="form-control uppercase" name="englishLiteracy" id="name_with_initials"
                                                           placeholder="englishLiteracy" autocomplete="off" value="<%= applications.getEnglishLiteracy()%>" readonly/>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label"><b>17. IT Literacy</b></label>
                                                    <input type="text" class="form-control uppercase" name="itLiteracy" id="name_with_initials"
                                                           placeholder="englishLiteracy" autocomplete="off" value="<%= applications.getItLiteracy()%>" readonly/>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label"><b>18. Employment Status </b></label>
                                                    <input type="text" class="form-control" id="zscore" name="employmentStatus"
                                                           placeholder="Employment Status" autocomplete="off" value="<%= applications.getEmploymentStatus()%>" readonly/> 


                                                </div>

                                                <label class="control-label" for="inputUserNameOne"><b>19. Details of payment of application processing fee</b></label><br>


                                                <div class="form-group inline">

                                                    <label class="control-label" for="inputUserNameOne">Date of Payment</label>
                                                    <div class="input-group" id="dateOfPayment">
                                                        <span class="input-group-addon">
                                                            <i class="icon wb-calendar" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" data-format="yyyy/mm/dd" data-plugin="datepicker"  name="dateOfPayment" id="date_of_payment" value="<%= applications.getDateOfPayment()%>" placeholder="YYYY/MM/DD" readonly/>
                                                    </div>

                                                </div><br>
                                                <div class="form-group inline">

                                                    <label class="control-label" for="inputUserNameOne">Branch of the People's Bank</label>

                                                    <input type="text" class="form-control" id="branch" name="bankBranch"
                                                           placeholder="Bank Branch" autocomplete="off" value="<%= applications.getBankBranch()%>"  readonly/>


                                                </div>   
                                                <br>    

                                                <div class="form-group">
                                                    <label class="control-label"><b>20. Following Documents are Annexed.</b></label>
                                                    <div class="input-group">

                                                    </div>
                                                    <div class="form-group inline">

                                                        <label class="control-label" for="inputUserNameOne"><b>Applied Date </b></label>

                                                        <input type="text" class="form-control" id="branch" name="appliedDate"
                                                               placeholder="Applied Date" autocomplete="off" value="<%= applications.getAppliedDate()%>" readonly/>


                                                    </div>

                                                </div>



                                                <br>

                                                <input type="hidden" name="id" value="<%= applications.getId()%>" class="input-sm"/>

                                            </div>
                                            <!-- End Panel 2-->                          

                                        </form>
                                        <!-- Wizard Content -->
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <!-- End Panel Wizard Form Container -->
                            </div>

                        </div>
                    </div>
                    <div id="studentResult" class="tab-pane fade">
                        <h3>Student Result</h3>
                        <p>Student Result Details Area</p>
                    </div>


                </div>
            </div>

        </div>
    </div></div>

<%@include file="includes/footer_admin.jsp" %>

<script>
    (function (document, window, $) {
        'use strict';

        var Site = window.Site;
        $(document).ready(function () {
            Site.run();
        });
    })(document, window, jQuery);
</script>

</body>
</html>
