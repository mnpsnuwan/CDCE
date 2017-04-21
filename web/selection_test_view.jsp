<%-- 
    Document   : selection_test_view
    Created on : Oct 27, 2016, 10:22:14 AM
    Author     : nuwan
--%>

<%@page import="com.CDCE.DAOs.SubjectsDAO"%>
<%@page import="com.CDCE.Model.ApplicationSubject"%>
<%@page import="com.CDCE.DAOs.ApplicationSubjectDAO"%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="includes/header_admin.jsp" %>
<%@include file="includes/side_navibar_admin.jsp" %>


<div class="page">
    <div class="page-header">
        <h1 class="page-title">Applications Details</h1>
        <ol class="breadcrumb">
            <li><a href="admin_dashboard.jsp">Dashboard</a></li>
            <li><a href="selection_test.jsp">Selection Test</a></li>
            <li class="active">Selection Test Selected Applications</li>
        </ol>
    </div>

    <div class="page-content">

        <div class="panel">



            <div class="panel-body">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#application">Application</a></li>
                    <li><a data-toggle="tab" href="#qualifications">Qualifications</a></li>
                    <li><a data-toggle="tab" href="#subjects">Subjects</a></li>
                    <li><a data-toggle="tab" href="#venue">Venue Selection</a></li>
                    <li><a data-toggle="tab" href="#index">Index Generation</a></li>
                </ul>

                <div class="tab-content">
                    <br>
                    <div id="application" class="tab-pane fade in active">

                        <div class="row">


                            <div class="col-md-10 col-sm-offset-1">
                                <!-- Panel Wizard Form Container -->
                                <div class="panel" id="exampleWizardFormContainer">
                                    <!--                                    <div class="panel-heading" style="text-align: center;">
                                    
                                                                            <h3 class="panel-title"><b>Bachelor of Arts General(External) Degree Programme
                                                                                    <br>Application of Registration - 2016</b></h3>
                                                                        </div>-->
                                    <div class="panel-body">
                                        <!-- Steps -->
                                        <!--div class="pearls row">
                                            <div class="pearl current col-xs-6">
                                                <div class="pearl-icon"><i class="icon wb-user" aria-hidden="true"></i></div>
                                                <span class="pearl-title">1</span>
                                            </div>
                                            <div class="pearl col-xs-6">
                                                <div class="pearl-icon"><i class="icon wb-user" aria-hidden="true"></i></div>
                                                <span class="pearl-title">2</span>
                                            </div>

                                        </div-->
                                        <!-- End Steps -->

                                        <!--Access data by ApplicationDAO and Applications-->

                                        <%    int id = 0;

                                            if (request.getParameter("action").equals("edit") && request.getParameter("id") != null) {
                                                String suid = request.getParameter("id");
                                                Applications applications = new Applications(Integer.parseInt(suid));

                                                id = applications.getId();

                                        %>

                                        <!-- Wizard Content -->

                                        <form class="wizard-content" id="application_view_form" name="application_view_form" method="post" action="ChangeApplicationDetails">

                                            <!-- Start Panel 1-->
                                            <div class="wizard-pane active" role="tabpanel">
                                                <h3 class="img-responsive panel-title"><b>Bachelor of Arts General(External) Degree Programme Selection Test - 2017</b></h3>
                                                <br>
                                                <input type="hidden" name="program_id" id="program_id" value="1" />
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label class="control-label" for="title"><b>01. Title</b></label>
                                                            <!--<input type="text" class="form-control" id="title" name="title" 
                                                                   placeholder="Title" autocomplete="off" value="<%--=applications.getTitle()--%>"/>-->
                                                            <select class="form-control" id="title" name="title">

                                                                <option value="<%=applications.getTitle()%>"><%=applications.getTitle()%></option>
                                                                <%
                                                                    TitleDAO titdao = new TitleDAO();
                                                                    ArrayList<Title> tlist = (ArrayList) titdao.tList();
                                                                    request.setAttribute("tlist", tlist);
                                                                    //if(){
                                                                %>

                                                                <c:forEach items="${tlist}"  var="tlist">                                
                                                                    <option value="${tlist['label']}">${tlist['label']}</option> 
                                                                </c:forEach>


                                                                <%
                                                                    //}
%>

                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <div class="form-group">
                                                            <label class="control-label" for="full_name"><b>Full Name</b></label>
                                                            <input type="text" class="form-control uppercase" id="full_name" name="fullName" 
                                                                   placeholder="Full Name" autocomplete="off" value="<%= applications.getFullName()%>"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>        
                                                <input type="hidden" id="page_name" name="page_name" value="border_info" />
                                                <div class="form-group">
                                                    <label class="control-label" for="name_with_initials"><b>02. Name with Initials</b></label>
                                                    <input type="text" class="form-control uppercase" name="nameWithInitials" id="name_with_initials"
                                                           placeholder="Name with Initials" autocomplete="off" value="<%= applications.getNameWithInitials()%>" />
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label" for="permanent_address"><b>03. Permanent Address</b></label>
                                                    <input type="text" class="form-control" name="permanentAddress" id="permanent_address"
                                                           placeholder="Permanent Address" autocomplete="off" value="<%= applications.getPermanentAddress()%>"/>
                                                </div>
                                                <br>    
                                                <div class="form-group">
                                                    <label class="control-label" for="inputUserNameOne"><b>04. Postal Address</b></label>
                                                    <input type="text" class="form-control" name="postalAddress" id="correspondence_address"
                                                           placeholder="Address for Correspondence" autocomplete="off" value="<%= applications.getPostalAddress()%>" />
                                                </div>
                                                <br>    

                                                <div class="row">

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="tel_home"><b>05. District</b></label>
                                                            <input type="text" class="form-control" id="tel_office" name="district"
                                                                   placeholder="District" autocomplete="off" value="<%= applications.getDistrict()%>" maxlength="15"/>
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
                                                                   placeholder="Province" autocomplete="off" value="<%= applications.getProvince()%>" />
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="tel_mobile"><b>06.II Postal Code</b></label>
                                                            <input type="text" class="form-control" id="postal_code" name="postalCode"
                                                                   placeholder="Postal Code" autocomplete="off" value="<%= applications.getPostalCode()%>" maxlength="15" />
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
                                                                   placeholder="Home" autocomplete="off" value="<%= applications.getTelHome()%>" maxlength="15"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="tel_office"><b>Office</b></label>
                                                            <input type="text" class="form-control" id="tel_office" name="telOffice"
                                                                   placeholder="Office" autocomplete="off" value="<%= applications.getTelOffice()%>" maxlength="15"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="tel_mobile"><b>Mobile</b></label>
                                                            <input type="text" class="form-control" id="tel_mobile" name="telMobile"
                                                                   placeholder="Mobile" autocomplete="off" value="<%= applications.getTelMobile()%>" maxlength="15" />
                                                        </div>
                                                    </div>
                                                </div>   
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label" for="email"><b>08. E-mail Address</b></label>
                                                    <input type="email" class="form-control" id="email" name="email" 
                                                           placeholder="E-mail Address" autocomplete="off" value="<%= applications.getEmail()%>" />  
                                                </div>
                                                <br>    

                                                <div class="row">

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label"><b>09. Gender </b></label>
                                                            <input type="text" class="form-control" id="postal_code" name="gender"
                                                                   placeholder="Gender" autocomplete="off" value="<%= applications.getGender()%>" maxlength="15" />

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label"><b>10. Civil Status </b></label>
                                                            <input type="text" class="form-control" id="civil_status" name="civilStatus"
                                                                   placeholder="Civil Status" autocomplete="off" value="<%= applications.getCivilStatus()%>"/>    

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
                                                                <input type="text" class="form-control" data-format="yyyy/mm/dd" data-plugin="datepicker"  name="dateOfBirth" id="date_of_birth" value="<%= applications.getDateOfBirth()%>" placeholder="YYYY/MM/DD">
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
                                                                   autocomplete="off"  value="<%= applications.getNationality()%>"/>
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
                                                                   placeholder="" autocomplete="off" maxlength="4" value="<%= applications.getAlYear()%>"/>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="index_al">Index No</label>
                                                            <input type="text" class="form-control" id="index_al" name="alIndex"
                                                                   placeholder="" autocomplete="off" maxlength="10" value="<%= applications.getAlIndex()%>"/>
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
                                                                    <td><input type="text" class="form-control" id="alGrade" value="<%= alSubjectList.get(i).getSubject()%>"/>
                                                                    <td><input type="text" class="form-control" value="<%= alSubjectList.get(i).getGrade()%>"/>

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
                                                                   placeholder="" autocomplete="off" maxlength="6" value="<%= applications.getAlZScore()%>"/>
                                                        </div>
                                                    </div>


                                                </div>                                      

                                                <div class="form-group">
                                                    <label class="control-label"><b>15. Professional or other Qualifications Acquired</b></label>
                                                    <textarea class="form-control" rows="2" id="professional_qualifications" style="resize: vertical" name="professionalQualifications"><%= applications.getProfessionalQualifications()%></textarea>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label"><b>16. English Literacy</b></label>
                                                    <input type="text" class="form-control uppercase" name="englishLiteracy" id="name_with_initials"
                                                           placeholder="englishLiteracy" autocomplete="off" value="<%= applications.getEnglishLiteracy()%>" />
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label"><b>17. IT Literacy</b></label>
                                                    <input type="text" class="form-control uppercase" name="itLiteracy" id="name_with_initials"
                                                           placeholder="englishLiteracy" autocomplete="off" value="<%= applications.getItLiteracy()%>" />
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label"><b>18. Employment Status </b></label>
                                                    <input type="text" class="form-control" id="zscore" name="employmentStatus"
                                                           placeholder="Employment Status" autocomplete="off" value="<%= applications.getEmploymentStatus()%>"/> 


                                                </div>

                                                <label class="control-label" for="inputUserNameOne"><b>19. Details of payment of application processing fee</b></label><br>


                                                <div class="form-group inline">

                                                    <label class="control-label" for="inputUserNameOne">Date of Payment</label>
                                                    <div class="input-group" id="dateOfPayment">
                                                        <span class="input-group-addon">
                                                            <i class="icon wb-calendar" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" data-format="yyyy/mm/dd" data-plugin="datepicker"  name="dateOfPayment" id="date_of_payment" value="<%= applications.getDateOfPayment()%>" placeholder="YYYY/MM/DD"/>
                                                    </div>

                                                </div><br>
                                                <div class="form-group inline">

                                                    <label class="control-label" for="inputUserNameOne">Branch of the People's Bank</label>

                                                    <input type="text" class="form-control" id="branch" name="bankBranch"
                                                           placeholder="Bank Branch" autocomplete="off" value="<%= applications.getBankBranch()%>"  />


                                                </div>   
                                                <br>    

                                                <div class="form-group">
                                                    <label class="control-label"><b>20. Following Documents are Annexed.</b></label>
                                                    <div class="input-group">

                                                    </div>
                                                    <div class="form-group inline">

                                                        <label class="control-label" for="inputUserNameOne"><b>Applied Date </b></label>

                                                        <input type="text" class="form-control" id="branch" name="appliedDate"
                                                               placeholder="Applied Date" autocomplete="off" value="<%= applications.getAppliedDate()%>"  />


                                                    </div>

                                                </div>

                                                <br>

                                                <input type="hidden" name="id" value="<%= applications.getId()%>" class="input-sm"/>
                                                <input type="hidden" name="stFlag" value="<%= applications.getStFlag()%>" class="input-sm"/>
                                                <input type="hidden" name="iFlag" value="<%= applications.getiFlag()%>" class="input-sm"/>
                                                <input type="hidden" name="rFlag" value="<%= applications.getrFlag()%>" class="input-sm"/>

                                                <div class="updatebtn" style="text-align: center">
                                                    <%--<a href="?reject" class="reject"><button value="<%=applications.getId()%>" type="button" value="<%=applications.getId()%>" style="background-color:#da4939" id="reject<%=applications.getId()%>" class="pull-left tooltip-dark btn-sm btn-icon btn-inverse" data-toggle="tooltip" data-original-title="Reject" data-trigger="focus / hover"><i class="grey-100 icon wb-close" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button></a>--%>
                                                    <button style="width: 100px; height: 40px;" type="reset" class="btn-dark" name="reset">Reset</button>
                                                    <button style="width: 100px; height: 40px;" type="submit" class="btn-warning" name="update">Update</button>
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

                        <div class="row">

                            <div class="col-md-10 col-sm-offset-1">
                                <!-- Panel Wizard Form Container -->
                                <div class="panel" id="exampleWizardFormContainer">
                                    <!--                                    <div class="panel-heading" style="text-align: center;">
                                    
                                                                            <h3 class="panel-title"><b>Bachelor of Arts General(External) Degree Programme
                                                                                    <br>Application of Registration - 2016</b></h3>
                                                                        </div>-->
                                    <div class="panel-body">

                                        <form class="wizard-content" id="BAApplication" method="post" action="BAFormServlet">
                                            <div class="wizard-pane" id="exampleBillingOne" role="tabpanel">
                                                <h3 class="img-responsive panel-title"><b>Qualifications</b></h3>
                                                <br>
                                                <label class="control-label" for="inputUserNameOne"><b>01. Performance at the G.C.E. (A/L) Examination</b></label>
                                                <div class="row">

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="year_al">Year(YYYY)</label>
                                                            <input type="text" class="form-control" id="year_al" name="year_al"
                                                                   placeholder="" autocomplete="off" maxlength="4" value="<%= applications.getAlYear()%>" readonly/>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label" for="index_al">Index No</label>
                                                            <input type="text" class="form-control" id="index_al" name="index_al"
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
                                                                <tr>
                                                                    <%
                                                                        for (int i = 0; i < alSubjectList.size(); i++) {

                                                                    %>

                                                                <tr>
                                                                    <td><input type="text" class="form-control" id="alGrade" value="<%= alSubjectList.get(i).getSubject()%>" readonly/>
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
                                                            <input type="text" class="form-control" id="zscore" name="zscore"
                                                                   placeholder="" autocomplete="off" maxlength="6" value="<%= applications.getAlZScore()%>" readonly/>
                                                        </div>
                                                    </div>


                                                </div>                                      

                                                <div class="form-group">
                                                    <label class="control-label"><b>02. Professional or other Qualifications Acquired</b></label>
                                                    <textarea class="form-control" rows="2" id="professional_qualifications" style="resize: vertical" name="professional_qualifications" readonly><%= applications.getProfessionalQualifications()%></textarea>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label"><b>03. English Literacy</b></label>
                                                    <input type="text" class="form-control uppercase" name="englishLiteracy" id="name_with_initials"
                                                           placeholder="englishLiteracy" autocomplete="off" value="<%= applications.getEnglishLiteracy()%>" readonly/>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label"><b>04. IT Literacy</b></label>
                                                    <input type="text" class="form-control uppercase" name="englishLiteracy" id="name_with_initials"
                                                           placeholder="englishLiteracy" autocomplete="off" value="<%= applications.getItLiteracy()%>" readonly/>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label"><b>05. Employment Status </b></label>

                                                    <input type="text" class="form-control" id="inputHorizontalEmployed" name="employment_status"
                                                           placeholder="Employment Status" autocomplete="off" value="<%= applications.getEmploymentStatus()%>" maxlength="15" readonly/>



                                                </div>

                                                <br>    

                                            </div>

                                        </form>

                                        <!--                                        <div style="text-align: center">
                                                                                    <button style="width: 100px; height: 40px;" type="reset" class="btn-dark" name="reset" value="Reset">Reset</button>
                                                                                    <button style="width: 100px; height: 40px;" type="submit" class="btn-warning" name="update" value="Update">Update</button>
                                        
                                                                                </div>-->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        ApplicationSubjectDAO appsubdao = new ApplicationSubjectDAO();
                        ArrayList<ApplicationSubject> subjectList = appsubdao.subjectList(Integer.parseInt(suid));
                        SubjectsDAO sudao = new SubjectsDAO();
                        appsubdao.close();
                        request.setAttribute("subjectList", subjectList);

                    %>


                    <div id="subjects" class="tab-pane fade">
                        <div class="row">

                            <div class="col-md-10 col-sm-offset-1">
                                <!-- Panel Wizard Form Container -->
                                <div class="panel" id="exampleWizardFormContainer">
                                    <!--                                    <div class="panel-heading" style="text-align: center;">
                                    
                                                                            <h3 class="panel-title"><b>Bachelor of Arts General(External) Degree Programme
                                                                                    <br>Application of Registration - 2016</b></h3>
                                                                        </div>-->
                                    <div class="panel-body">

                                        <form class="wizard-content" id="BAApplication" action="">
                                            <div>
                                                <h3 class="img-responsive panel-title"><b>Selected Subject</b></h3>
                                                <br>
                                                <label class="control-label"><b>Medium</b></label>
                                                <div class="row">

                                                    <div class="col-sm-4"> 
                                                        <div class="form-group">
                                                            <div class="checkbox-custom checkbox-primary">
                                                                <input type="checkbox" id="sinhala" value="Sinhala"/>

                                                                <label class="control-label" for="sinhala">Sinhala</label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4"> 
                                                        <div class="form-group">
                                                            <div class="checkbox-custom checkbox-primary">
                                                                <input type="checkbox" id="tamil" value="Tamil"/>
                                                                <label class="control-label" for="tamil">Tamil</label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4"> 
                                                        <div class="form-group">
                                                            <div class="checkbox-custom checkbox-primary">
                                                                <input type="checkbox" id="english" value="English"/>

                                                                <label class="control-label" for="english">English</label>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div> 
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label"><b>Basic Subjects</b></label>
                                                    <div class="input-group">
                                                        <table class="table editable-table table-striped table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>Id</th>
                                                                    <th>Code</th>
                                                                    <th>Name</th>
                                                                </tr>
                                                            </thead>
                                                            <%                                                                for (ApplicationSubject subject : subjectList) {
                                                                    if (subject.getSubcategory().equals("FND")) {

                                                            %>
                                                            <tbody>
                                                                <tr>
                                                                    <td><%--
                                                                            <c:forEach items="${subjects100_0}"  var="subjects100_0">                                
                                                                                <input value="${subjects100_0['id']}"/>
                                                                            </c:forEach>
                                                                        --%>
                                                                        <%= sudao.getSubjects(subject.getSubjectId()).getId()%>
                                                                    </td>
                                                                    <td>
                                                                        <%= sudao.getSubjects(subject.getSubjectId()).getCode()%>
                                                                    </td>
                                                                    <td>
                                                                        <%= sudao.getSubjects(subject.getSubjectId()).getName()%>
                                                                    </td>

                                                                </tr>
                                                            </tbody>
                                                            <%
                                                                    }
                                                                }
                                                            %>
                                                        </table>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label class="control-label"><b>Supplementary Subject</b></label>
                                                    <div class="input-group">

                                                        <table class="table editable-table table-striped table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>Id</th>
                                                                    <th>Code</th>
                                                                    <th>Name</th>
                                                                </tr>
                                                            </thead>
                                                            <%--                                                                    
                                                                    for (Subject subsup : subjects100_1) {
                                                            --%>
                                                            <%      for (ApplicationSubject subject : subjectList) {
                                                                    if (subject.getSubcategory().equals("SUP")) {
                                                            %>

                                                            <tbody>
                                                                <tr>
                                                                    <td><%--
                                                                            <c:forEach items="${subjects100_0}"  var="subjects100_0">                                
                                                                                <input value="${subjects100_0['id']}"/>
                                                                            </c:forEach>
                                                                        --%>
                                                                        <%= sudao.getSubjects(subject.getSubjectId()).getId()%>
                                                                    </td>
                                                                    <td>
                                                                        <%= sudao.getSubjects(subject.getSubjectId()).getCode()%>
                                                                    </td>
                                                                    <td>
                                                                        <%= sudao.getSubjects(subject.getSubjectId()).getName()%>
                                                                    </td>

                                                                </tr>
                                                            </tbody>
                                                            <%
                                                                    }
                                                                }
                                                            %>
                                                        </table>

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label"><b>Other Subjects</b></label>
                                                    <div class="input-group">
                                                        <table class="table editable-table table-striped table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>Id</th>
                                                                    <th>Code</th>
                                                                    <th>Name</th>
                                                                </tr>
                                                            </thead>
                                                            <%--                                                                    
                                                                    for (Subject subother : subjects100_2) {
                                                            --%>
                                                            <%     for (ApplicationSubject subject : subjectList) {
                                                                    if (subject.getSubcategory().equals("OTH")) {
                                                            %>
                                                            <tbody>
                                                                <tr>
                                                                    <td><%--
                                                                            <c:forEach items="${subjects100_0}"  var="subjects100_0">                                
                                                                                <input value="${subjects100_0['id']}"/>
                                                                            </c:forEach>
                                                                        --%>
                                                                        <%= sudao.getSubjects(subject.getSubjectId()).getId()%>
                                                                    </td>
                                                                    <td>
                                                                        <%= sudao.getSubjects(subject.getSubjectId()).getCode()%>
                                                                    </td>
                                                                    <td>
                                                                        <%= sudao.getSubjects(subject.getSubjectId()).getName()%>
                                                                    </td>

                                                                </tr>
                                                            </tbody>
                                                            <%
                                                                    }
                                                                }
                                                            %>
                                                        </table>

                                                    </div>

                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <%
                                }
                            %>


                        </div>

                    </div>
                    <div id="venue" class="tab-pane fade">
                        <h3>Venue Selection</h3>
                        <p>Venue Selection Area</p>
                    </div>
                    <div id="index" class="tab-pane fade">
                        <h3>Index Generation</h3>
                        <p>Index Generation Area</p>
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

