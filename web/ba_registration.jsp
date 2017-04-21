<%@page import="java.util.ArrayList"%>
<%@include file="includes/old/header.jsp" %>

<!-- Page -->
<div class="page animsition">

    <div class="page-content container-fluid">
        <div class="row">

            <div class="col-md-10 col-sm-offset-1">
                <!-- Panel Wizard Form Container -->
                <div class="panel" id="exampleWizardForm">
                    <div class="panel-heading" style="text-align: center;">
                        <h3 class="panel-title"><b>Centre for Distance & Continuing Education 
                                <br>University of Peradeniya</b></h3>
                        <h4>Bachelor of Business Administration Online Degree Programme
                            <br>Registration Application Form</h4>
                    </div><br>
                    <div class="panel-body">
                        <!-- Steps -->
                        <div class="pearls row">
                            <div class="pearl current col-xs-4">
                                <div class="pearl-icon"><i class="icon wb-user" aria-hidden="true"></i></div>
                                <span class="pearl-title">1</span>
                            </div>
                            <div class="pearl col-xs-4">
                                <div class="pearl-icon"><i class="icon wb-user" aria-hidden="true"></i></div>
                                <span class="pearl-title">2</span>
                            </div>
                            <div class="pearl col-xs-4">
                                <div class="pearl-icon"><i class="icon wb-check" aria-hidden="true"></i></div>
                                <span class="pearl-title">3</span>
                            </div>
                        </div>
                        <!-- End Steps -->

                        <!-- Wizard Content -->
                        <form class="wizard-content" id="exampleFormContainer">

                            <!-- Start Panel 1-->
                            <div class="wizard-pane active" role="tabpanel">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label class="control-label"><b>1. Title</b></label>
                                            <select class="form-control" data-plugin="selectpicker" name="title" id="title">
                                                <option value="">Please Select</option>
                                                <option value="Rev">Rev</option>
                                                <option value="Mr">Mr</option>
                                                <option value="Mrs">Mrs</option>
                                                <option value="Miss">Miss</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="form-group">
                                            <label class="control-label" for="full_name"><b>Full Name</b></label>
                                            <input type="text" class="form-control" id="full_name" name="full_name" 
                                                   placeholder="Full Name" autocomplete="off"/>
                                        </div>
                                    </div>
                                </div>

                                <input type="hidden" id="page_name" name="page_name" value="border_info" />
                                <div class="form-group">
                                    <label class="control-label" for="name_with_initials"><b>2. Name with Initials</b></label>
                                    <input type="text" class="form-control" name="name_with_initials" id="name_with_initials"
                                           placeholder="Name with Initials" autocomplete="off"/>
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="permanent_address"><b>3. Permanent Address</b></label>
                                    <input type="text" class="form-control" name="permanent_address" id="permanent_address"
                                           placeholder="Permanent Address" autocomplete="off"/>
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="inputUserNameOne"><b>4. Postal Address</b></label>
                                    <input type="text" class="form-control" name="postal_address" id="postal_address"
                                           placeholder="Postal Address" autocomplete="off"/>
                                </div>

                                <label class="control-label" for="inputUserNameOne"><b>5. Telephone Number/s</b></label>
                                <div class="row">

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="control-label" for="tel_home">Home</label>
                                            <input type="text" class="form-control" id="tel_home" name="tel_home"
                                                   placeholder="Home" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="control-label" for="tel_mobile">Mobile</label>
                                            <input type="text" class="form-control" id="tel_mobile" name="tel_mobile"
                                                   placeholder="Mobile" autocomplete="off"/>
                                        </div>
                                    </div>
                                </div>   

                                <div class="form-group">
                                    <label class="control-label" for="email"><b>6. E-mail Address</b></label>
                                    <input type="text" class="form-control" id="email" name="email" 
                                           placeholder="Postal Address" autocomplete="off"/>
                                    <label class="control-label" for="inputUserNameOne">*Please open a new account if you do not have</label>   
                                </div>


                                <div class="form-group">
                                    <label class="control-label"><b>7. District of Residential Address</b></label>
                                    <select class="form-control" data-plugin="selectpicker" id="district" name="district" onchange="getProvince(this);">

                                        <option value="0">Please Select</option>

                                        <option value=""></option>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="control-label"><b>8. Province of Residential Address</b></label>
                                    <input type="text" class="form-control" id="province" name="province" 
                                           placeholder="Postal Address" autocomplete="off"/>
                                </div>

                                <div class="form-group">
                                    <label class="control-label"><b>9. Gender </b></label>
                                    <div>
                                        <div class="radio-custom radio-default radio-inline">
                                            <input type="radio" id="fld_gender_male" name="fld_gender" value="Male"/>
                                            <label for="fld_gender_male">Male</label>
                                        </div>
                                        <div class="radio-custom radio-default radio-inline">
                                            <input type="radio" id="fld_gender_female" name="fld_gender" value="Female" checked />
                                            <label for="fld_gender_female">Female</label>
                                        </div>
                                    </div>    

                                </div>    

                                <div class="form-group">
                                    <label class="control-label"><b>10. Date of Birth</b></label>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="icon wb-calendar" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" data-plugin="datepicker" name="fld_date_of_birth" id="fld_date_of_birth">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label"><b>11. National Identity Card Number</b></label>
                                    <input type="text" class="form-control" id="nic_no" name="nic_no" placeholder="National Identity Card Number"
                                           autocomplete="off"/>
                                </div>

                            </div>
                            <!-- End Panel 1-->

                            <!-- Start Panel 2-->
                            <div class="wizard-pane" id="exampleBillingOne" role="tabpanel">

                                <label class="control-label" for="inputUserNameOne"><b>12. Performance at the G.C.E. (A/L) Examination</b></label>
                                <div class="row">

                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="control-label" for="year_al">Year(YYYY)</label>
                                            <input type="text" class="form-control" id="year_al" name="year_al"
                                                   placeholder="" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="control-label" for="stream_al">Subject Stream</label>
                                            <input type="text" class="form-control" id="stream_al" name="stream_al"
                                                   placeholder="" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="control-label" for="index_al">Index No</label>
                                            <input type="text" class="form-control" id="index_al" name="index_al"
                                                   placeholder="" autocomplete="off"/>
                                        </div>
                                    </div>
                                </div>  
                                <div class="row">
                                    <!--                                    <div class="col-sm-10 col-sm-offset-1">
                                                                            <table class="editable-table table table-striped table-bordered" id="subject_list_al">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th class="col-sm-7">Subject</th>
                                                                                        <th class="col-sm-3">Grade/Marks</th>
                                    
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td>&nbsp;</td>
                                                                                        <td></td>
                                    
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>&nbsp;</td>
                                                                                        <td></td>
                                    
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>&nbsp;</td>
                                                                                        <td></td>
                                    
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>&nbsp;</td>
                                                                                        <td></td>
                                    
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>General English</td>
                                                                                        <td></td>
                                    
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>Common General Test</td>
                                                                                        <td></td>
                                    
                                                                                    </tr>
                                    
                                                                                </tbody>
                                    
                                                                            </table>   
                                                                        </div>-->

                                    <div class="col-sm-10 col-sm-offset-1">
                                        <table class="table table-striped table-bordered" id="subject_list_al">
                                            <thead>
                                                <tr>
                                                    <th class="col-sm-7">Subject</th>
                                                    <th class="col-sm-3">Grade/Marks</th>

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
                                                    <td><input type="number" class="form-control" id="alGrade"/>

                                                </tr>
                                            </tbody>

                                        </table>   
                                    </div>

                                </div>    

                                <label class="control-label" for="inputUserNameOne">OR</label><br>
                                <label class="control-label" for="inputUserNameOne">Any other Equivalent Qualifications Recognized by the UGC</label>
                                <div class="form-group">  
                                    <textarea class="form-control" id="textareaDefault" rows="5"></textarea>
                                </div>

                                <label class="control-label" for="inputUserNameOne"><b>13. Performance at the G.C.E. (O/L) Examination</b></label>
                                <div class="row">

                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="control-label" for="inputUserNameOne">Year(YYYY)</label>
                                            <input type="text" class="form-control" id="year_ol" name="year_ol"
                                                   placeholder="" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="control-label" for="inputUserNameOne">Index No</label>
                                            <input type="text" class="form-control" id="index_ol" name="index_ol"
                                                   placeholder="" autocomplete="off"/>
                                        </div>
                                    </div>
                                </div>  
                                <div class="row">
                                    <div class="col-sm-5 col-sm-offset-1">
                                        <table class="editable-table table table-striped table-bordered" id="subject_list1_ol">
                                            <thead>
                                                <tr>
                                                    <th class="col-sm-6">Subject</th>
                                                    <th class="col-sm-2">Grade</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>

                                            </tbody>

                                        </table>   
                                    </div>
                                    <div class="col-sm-5">
                                        <table class="editable-table table table-striped table-bordered" id="subject_list2_ol">
                                            <thead>
                                                <tr>
                                                    <th class="col-sm-6">Subject</th>
                                                    <th class="col-sm-2">Grade</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td></td>

                                                </tr>

                                            </tbody>

                                        </table>   
                                    </div>
                                </div>      


                                <div class="form-group">
                                    <label class="control-label"><b>14. Professional or other Qualifications</b></label>
                                    <textarea class="form-control" id="textareaDefault" rows="5" name="personal_qualifications"></textarea>
                                </div>

                                <div class="form-group">
                                    <label class="control-label"><b>15. English Literacy</b></label>
                                    <select class="form-control" data-plugin="selectpicker" id="english_literacy" name="english_literacy">
                                        <option>Please Select</option>
                                        <option value="No">No</option>
                                        <option value="Average">Average</option>
                                        <option value="Good">Good</option>
                                        <option value="Excellent">Excellent</option>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="control-label"><b>16. IT Literacy</b></label>
                                    <select class="form-control" data-plugin="selectpicker" id="it_literacy" name="it_literacy">
                                        <option>Please Select</option>
                                        <option>No</option>
                                        <option>Average</option>
                                        <option>Good</option>
                                        <option>Excellent</option>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="control-label"><b>17. Employment Status </b></label>
                                    <div>
                                        <div class="radio-custom radio-default radio-inline">
                                            <input type="radio" id="inputHorizontalEmployed" name="employment_status" value="Employed"/>
                                            <label for="inputHorizontalEmployed">Employed</label>
                                        </div>
                                        <div class="radio-custom radio-default radio-inline">
                                            <input type="radio" id="inputHorizontalNotEmployed" name="employment_status" value="NotEmployed" checked />
                                            <label for="inputHorizontalEmployed">Not Employed</label>
                                        </div>
                                    </div>    

                                </div>


                            </div>
                            <!-- End Panel 2-->

                            <!-- Start Panel 3-->
                            <div class="wizard-pane" id="exampleGettingOne" role="tabpanel">

                                <label class="control-label" for="inputUserNameOne"><b>18. Application Processing Fee</b></label>
                                <br>

                                <div class="form-group inline">
                                    <label class="control-label" for="inputUserNameOne">(a) Rupees :</label>
                                    <label class="control-label" for="inputUserNameOne">Rs. 1000/=</label> 
                                </div>
                                <br>
                                <div class="form-group">
                                    <label class="control-label" for="inputUserNameOne">(b) Date of Payment :</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="icon wb-calendar" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" data-plugin="datepicker" name="date_of_payment" id="date_of_payment">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="control-label" for="inputUserNameOne">(c) Branch of the People's Bank :</label>
                                    <input type="text" class="form-control" id="branch" name="branch"
                                           placeholder="" autocomplete="off"/>
                                </div>
                                <label class="control-label" for="inputUserNameOne">(Receipt should be attached along with this application)</label>


                                <div class="form-group">
                                    <label class="control-label"><b>19. Following Documents are Annexed.</b></label>
                                    <div class="checkbox-custom checkbox-primary">
                                        <input type="checkbox" id="inputUnchecked" />
                                        <label for="inputUnchecked">Photocopy of birth certificate.</label>
                                    </div>
                                    <div class="checkbox-custom checkbox-primary">
                                        <input type="checkbox" id="inputChecked" />
                                        <label for="inputChecked">Photocopies of certificates of educational qualifications.</label>
                                    </div>
                                    <div class="checkbox-custom checkbox-primary">
                                        <input type="checkbox" id="inputChecked"  />
                                        <label for="inputChecked">Photocopy of National Identity Card. </label>
                                    </div>
                                    <div class="checkbox-custom checkbox-primary">
                                        <input type="checkbox" id="inputChecked"  />
                                        <label for="inputChecked">In the event of a discrepancy in the name appearing in your educational 
                                            certificates and/or your birth certificate an affidavit
                                        </label>
                                    </div>
                                    <div class="checkbox-custom checkbox-primary">
                                        <input type="checkbox" id="inputChecked"  />
                                        <label for="inputChecked">Original bank receipt for Rs. 1000/= (keep a photocopy with you)</label>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label"><b>20. Please affix a color photograph of 3.5 x 4.5 cm in size inside the box below.</b></label>

                                </div>    

                                <div class="form-group">

                                    <button type="button" class="btn btn-primary" id="btnAddClient">Add</button>
                                    <button type="button" class="btn btn-default" id="btnRemoveClient">Remove</button>

                                </div>
                            </div>
                            <!-- End Panel 3-->


                        </form>
                        <!-- Wizard Content -->
                    </div>
                </div>
                <!-- End Panel Wizard Form Container -->
            </div>


        </div>

    </div>

</div>
<!-- End Page -->

<%@include file="includes/old/footer.jsp" %>

<script>
    function getProvince(tr)
    {

        var district_id = tr.value;

        jQuery.ajax({
            type: "POST",
            url: "/Province//",
            dataType: 'json',
            data: {district_id: district_id},
            success: function (j) {


            }
        });

//        $district_id = this.id;
//        alert($district_id);
    }
</script>    