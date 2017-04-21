<%-- 
    Document   : footer_admin
    Created on : Oct 5, 2016, 2:18:50 PM
    Author     : nuwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--Administrator footer-->
<footer class="site-footer" style="text-align: center; background-color: #fffffc">
    <div class="site-footer-center">
        <p><span class="site-footer-legal">CDCE © 2016. All RIGHT RESERVED.</span></p>
        <p><span class="site-footer-legal">Solution by <a href="http://ucsc.cmb.ac.lk/">UCSC</a></span></p>
    </div>
</footer>
<!--End footer-->

<%--<!-- Core  -->
<script src="assets/vendor/jquery/jquery.js"></script>
<script src="assets/vendor/bootstrap/bootstrap.js"></script>
<script src="assets/vendor/animsition/jquery.animsition.js"></script>
<script src="assets/vendor/asscroll/jquery-asScroll.js"></script>
<script src="assets/vendor/mousewheel/jquery.mousewheel.js"></script>
<script src="assets/vendor/asscrollable/jquery.asScrollable.all.js"></script>
<script src="assets/vendor/ashoverscroll/jquery-asHoverScroll.js"></script>
<script src="assets/vendor/bootstrap-select/bootstrap-select.js"></script>

<!-- Plugins -->
<script src="assets/vendor/switchery/switchery.min.js"></script>
<script src="assets/vendor/intro-js/intro.js"></script>
<script src="assets/vendor/screenfull/screenfull.js"></script>
<script src="assets/vendor/slidepanel/jquery-slidePanel.js"></script>

<script src="assets/vendor/skycons/skycons.js"></script>
<script src="assets/vendor/chartist-js/chartist.min.js"></script>
<script src="assets/vendor/aspieprogress/jquery-asPieProgress.min.js"></script>
<script src="assets/vendor/jvectormap/jquery-jvectormap.min.js"></script>
<script src="assets/vendor/jvectormap/maps/jquery-jvectormap-ca-lcc-en.js"></script>
<script src="assets/vendor/matchheight/jquery.matchHeight-min.js"></script>

<script src="assets/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="assets/vendor/datatables-fixedheader/dataTables.fixedHeader.js"></script>
<script src="assets/vendor/datatables-bootstrap/dataTables.bootstrap.js"></script>
<script src="assets/vendor/datatables-responsive/dataTables.responsive.js"></script>
<script src="assets/vendor/datatables-tabletools/dataTables.tableTools.js"></script> 
<script src="assets/vendor/bootstrap-datepicker/bootstrap-datepicker.js"></script>
<script src="assets/vendor/jt-timepicker/jquery.timepicker.min.js"></script>
<script src="assets/vendor/datepair-js/datepair.min.js"></script>
<script src="assets/vendor/datepair-js/jquery.datepair.min.js"></script>
<script src="assets/vendor/jquery-strength/jquery-strength.min.js"></script>
<script src="assets/vendor/multi-select/jquery.multi-select.js"></script>
<script src="assets/vendor/formvalidation/formValidation.js"></script>
<script src="assets/vendor/formvalidation/framework/bootstrap.js"></script>
<script src="assets/vendor/matchheight/jquery.matchHeight-min.js"></script>
<script src="assets/vendor/jquery-wizard/jquery-wizard.js"></script>

<script src="assets/vendor/editable-table/mindmup-editabletable.js"></script>
<script src="assets/vendor/editable-table/numeric-input-example.js"></script>

<!-- Scripts -->
<script src="assets/js/core.js"></script>
<script src="assets/js/site.js"></script>

<script src="assets/js/sections/menu.js"></script>
<script src="assets/js/sections/menubar.js"></script>
<script src="assets/js/sections/sidebar.js"></script>

<script src="assets/js/configs/config-colors.js"></script>
<script src="assets/js/configs/config-tour.js"></script>

<script src="assets/js/components/asscrollable.js"></script>
<script src="assets/js/components/animsition.js"></script>
<script src="assets/js/components/slidepanel.js"></script>
<script src="assets/js/components/switchery.js"></script>
<script src="assets/js/components/matchheight.js"></script>
<script src="assets/js/components/jvectormap.js"></script>
<script src="assets/js/components/datatables.js"></script>
<script src="assets/js/components/bootstrap-select.js"></script>
<script src="assets/js/components/bootstrap-datepicker.js"></script>
<script src="assets/js/components/jt-timepicker.js"></script>
<script src="assets/js/components/datepair-js.js"></script>
<script src="assets/js/components/jquery-strength.js"></script>
<script src="assets/js/components/multi-select.js"></script>
<script src="assets/js/components/jquery-wizard.js"></script>
<script src="assets/js/components/matchheight.js"></script>
<script src="assets/js/form_validation.js"></script>
<script src="assets/js/components/editable-table.js"></script>



<script>
    (function (document, window, $) {
        'use strict';

        var Site = window.Site;

        $(document).ready(function ($) {
            Site.run();
        });

        // Example editable Table
        // ----------------------
        $('#subject_list_al').editableTableWidget().numericInputExample().find(
                'td:first').focus();

        $('#subject_list1_ol').editableTableWidget().numericInputExample().find(
                'td:first').focus();


        $('#subject_list2_ol').editableTableWidget().numericInputExample().find(
                'td:first').focus();

        // Example Wizard Form
        // -------------------
        (function () {
            // set up formvalidation
            $('#exampleAccountForm').formValidation({
                framework: 'bootstrap',
                fields: {
                    username: {
                        validators: {
                            notEmpty: {
                                message: 'The username is required'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: 'The username must be more than 6 and less than 30 characters long'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_\.]+$/,
                                message: 'The username can only consist of alphabetical, number, dot and underscore'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: 'The password is required'
                            },
                            different: {
                                field: 'username',
                                message: 'The password cannot be the same as username'
                            }
                        }
                    }
                }
            });

            $("#exampleBillingForm").formValidation({
                framework: 'bootstrap',
                fields: {
                    number: {
                        validators: {
                            notEmpty: {
                                message: 'The credit card number is required'
                            }
                            // creditCard: {
                            //   message: 'The credit card number is not valid'
                            // }
                        }
                    },
                    cvv: {
                        validators: {
                            notEmpty: {
                                message: 'The CVV number is required'
                            }
                            // cvv: {
                            //   creditCardField: 'number',
                            //   message: 'The CVV number is not valid'
                            // }
                        }
                    }
                }
            });

            // init the wizard
            var defaults = $.components.getDefaults("wizard");
            var options = $.extend(true, {}, defaults, {
                buttonsAppendTo: '.panel-body'
            });

            var wizard = $("#exampleWizardForm").wizard(options).data(
                    'wizard');

            // setup validator
            // http://formvalidation.io/api/#is-valid
            wizard.get("#exampleAccount").setValidator(function () {
                var fv = $("#exampleAccountForm").data('formValidation');
                fv.validate();

                if (!fv.isValid()) {
                    return false;
                }

                return true;
            });

            wizard.get("#exampleBilling").setValidator(function () {
                var fv = $("#exampleBillingForm").data('formValidation');
                fv.validate();

                if (!fv.isValid()) {
                    return false;
                }

                return true;
            });
        })();

        // Example Wizard Form Container
        // -----------------------------
        // http://formvalidation.io/api/#is-valid-container
        (function () {
            var defaults = $.components.getDefaults("wizard");
            var options = $.extend(true, {}, defaults, {
                onInit: function () {
                    $('#exampleFormContainer').formValidation({
                        framework: 'bootstrap',
                        fields: {
                            username: {
                                validators: {
                                    notEmpty: {
                                        message: 'The username is required'
                                    }
                                }
                            },
                            password: {
                                validators: {
                                    notEmpty: {
                                        message: 'The password is required'
                                    }
                                }
                            },
                            number: {
                                validators: {
                                    notEmpty: {
                                        message: 'The credit card number is not valid'
                                    }
                                }
                            },
                            cvv: {
                                validators: {
                                    notEmpty: {
                                        message: 'The CVV number is required'
                                    }
                                }
                            }
                        }
                    });
                },
                validator: function () {
                    var fv = $('#exampleFormContainer').data(
                            'formValidation');

                    var $this = $(this);

                    // Validate the container
                    fv.validateContainer($this);

                    var isValidStep = fv.isValidContainer($this);
                    if (isValidStep === false || isValidStep === null) {
                        return false;
                    }

                    return true;
                },
                onFinish: function () {
                    // $('#exampleFormContainer').submit();
                    alert("suka");
                },
                buttonsAppendTo: '.panel-body'
            });

            $("#exampleWizardForm").wizard(options);
        })();

        // Example Wizard Pager
        // --------------------------
        (function () {
            var defaults = $.components.getDefaults("wizard");

            var options = $.extend(true, {}, defaults, {
                step: '.wizard-pane',
                templates: {
                    buttons: function () {
                        var options = this.options;
                        return;
                        '<div class="btn-group" aria-label="Wizard Pager" role="group">' +
                                '<button class="btn btn-default btn-outline" data-target="#' +
                                this.id +
                                '" data-wizard="back"><i class="icon wb-chevron-left" aria-hidden="true"></i></button>' +
                                '<button class="btn btn-default btn-outline" data-target="#' +
                                this.id +
                                '" data-wizard="next"><i class="icon wb-chevron-right" aria-hidden="true"></i></button>' +
                                '<button class="btn btn-default btn-outline" data-target="#' +
                                this.id +
                                '" data-wizard="finish"><i class="icon wb-check" aria-hidden="true"></i></button>' +
                                '</div>';
                    }
                },
                buttonsAppendTo: '.panel-actions'
            });

            $("#exampleWizardPager").wizard(options);
        })();

        // Example Wizard Progressbar
        // --------------------------
        (function () {
            var defaults = $.components.getDefaults("wizard");

            var options = $.extend(true, {}, defaults, {
                step: '.wizard-pane',
                onInit: function () {
                    this.$progressbar = this.$element.find('.progress-bar')
                            .addClass('progress-bar-striped');
                },
                onBeforeShow: function (step) {
                    step.$element.tab('show');
                },
                onFinish: function () {
                    this.$progressbar.removeClass('progress-bar-striped').addClass(
                            'progress-bar-success');
                },
                onAfterChange: function (prev, step) {
                    var total = this.length();
                    var current = step.index + 1;
                    var percent = (current / total) * 100;

                    this.$progressbar.css({
                        width: percent + '%'
                    }).find('.sr-only').text(current + '/' + total);
                },
                buttonsAppendTo: '.panel-body'
            });

            $("#exampleWizardProgressbar").wizard(options);
        })();


    })(document, window, jQuery);
</script> --%>

<script src="assets/vendor/jquery/jquery.js"></script>
<script src="assets/vendor/bootstrap/bootstrap.js"></script>
<script src="assets/vendor/animsition/jquery.animsition.js"></script>
<script src="assets/vendor/asscroll/jquery-asScroll.js"></script>
<script src="assets/vendor/mousewheel/jquery.mousewheel.js"></script>
<script src="assets/vendor/asscrollable/jquery.asScrollable.all.js"></script>
<script src="assets/vendor/ashoverscroll/jquery-asHoverScroll.js"></script>
<script src="assets/vendor/bootstrap-select/bootstrap-select.js"></script>

<!-- Plugins -->
<script src="assets/vendor/switchery/switchery.min.js"></script>
<script src="assets/vendor/intro-js/intro.js"></script>
<script src="assets/vendor/screenfull/screenfull.js"></script>
<script src="assets/vendor/slidepanel/jquery-slidePanel.js"></script>

<script src="assets/vendor/skycons/skycons.js"></script>
<script src="assets/vendor/chartist-js/chartist.min.js"></script>
<script src="assets/vendor/aspieprogress/jquery-asPieProgress.min.js"></script>
<script src="assets/vendor/jvectormap/jquery-jvectormap.min.js"></script>
<script src="assets/vendor/jvectormap/maps/jquery-jvectormap-ca-lcc-en.js"></script>
<script src="assets/vendor/matchheight/jquery.matchHeight-min.js"></script>

<script src="assets/vendor/moment/moment.min.js"></script>
<script src="assets/vendor/fullcalendar/fullcalendar.js"></script>
<script src="assets/vendor/jquery-selective/jquery-selective.min.js"></script>
<script src="assets/vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script src="assets/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="assets/vendor/datatables-fixedheader/dataTables.fixedHeader.js"></script>
<script src="assets/vendor/datatables-bootstrap/dataTables.bootstrap.js"></script>
<script src="assets/vendor/datatables-responsive/dataTables.responsive.js"></script>
<script src="assets/vendor/datatables-tabletools/dataTables.tableTools.js"></script>

<script src="assets/vendor/bootstrap-datepicker/bootstrap-datepicker.js"></script>
<script src="assets/vendor/jt-timepicker/jquery.timepicker.min.js"></script>
<script src="assets/vendor/datepair-js/datepair.min.js"></script>
<script src="assets/vendor/datepair-js/jquery.datepair.min.js"></script>
<script src="assets/vendor/jquery-strength/jquery-strength.min.js"></script>
<script src="assets/vendor/multi-select/jquery.multi-select.js"></script>
<script src="assets/vendor/formvalidation/formValidation.js"></script>
<script src="assets/vendor/formvalidation/framework/bootstrap.js"></script>
<script src="assets/vendor/matchheight/jquery.matchHeight-min.js"></script>
<script src="assets/vendor/jquery-wizard/jquery-wizard.js"></script>

<!--Table plugins-->
<script src="assets/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="assets/vendor/datatables-fixedheader/dataTables.fixedHeader.js"></script>
<script src="assets/vendor/datatables-bootstrap/dataTables.bootstrap.js"></script>
<script src="assets/vendor/datatables-responsive/dataTables.responsive.js"></script>
<script src="assets/vendor/datatables-tabletools/dataTables.tableTools.js"></script>

<!-- Plugins For alert -->
<script src="assets/vendor/bootbox/bootbox.js"></script>
<script src="assets/vendor/bootstrap-sweetalert/sweet-alert.js"></script>
<script src="assets/vendor/toastr/toastr.js"></script>
<script src="assets/vendor/alertify-js/alertify.js"></script>

<!-- Scripts -->
<script src="assets/js/core.js"></script>
<script src="assets/js/site.js"></script>

<script src="assets/js/sections/menu.js"></script>
<script src="assets/js/sections/menubar.js"></script>
<script src="assets/js/sections/sidebar.js"></script>

<script src="assets/js/configs/config-colors.js"></script>
<script src="assets/js/configs/config-tour.js"></script>

<script src="assets/js/components/asscrollable.js"></script>
<script src="assets/js/components/animsition.js"></script>
<script src="assets/js/components/slidepanel.js"></script>
<script src="assets/js/components/switchery.js"></script>
<script src="assets/js/components/matchheight.js"></script>
<script src="assets/js/components/jvectormap.js"></script>
<script src="assets/js/components/datatables.js"></script>

<script src="assets/js/components/bootstrap-select.js"></script>
<script src="assets/js/components/bootstrap-datepicker.js"></script>
<script src="assets/js/components/jt-timepicker.js"></script>
<script src="assets/js/components/datepair-js.js"></script>
<script src="assets/js/components/jquery-strength.js"></script>
<script src="assets/js/components/multi-select.js"></script>
<script src="assets/js/components/jquery-wizard.js"></script>
<script src="assets/js/components/matchheight.js"></script>
<script src="assets/js/form_validation.js"></script>

<!--For calendar-->
<script src="assets/js/components/bootstrap-touchspin.js"></script>
<script src="assets/js/components/bootstrap-datepicker.js"></script>
<script src="assets/js/apps/app.js"></script>
<script src="assets/js/apps/calendar.js"></script>


<!--<script>
    (function (document, window, $) {
        'use strict';

        var Site = window.Site;
        $(document).ready(function () {
            Site.run();
        });
    })(document, window, jQuery);
</script>-->

<!--<script>
    (function (document, window, $) {
        'use strict';

        var Site = window.Site;
        var page_name = $('#page_name').val();
        
        ///////////////////// Tab Change ////////////////////////////////
        
            //activate given tab
            function activaTab(tab){
                $('.nav-tabs a[href="#' + tab + '"]').tab('show');
            };        
            //activate corect tab afer page loading
            $(document).ready(function () {
                 var query=window.location.search.substring(1);
                            if(query===""){
                                activaTab('exampleTopHome');
                            }
                            else{
                                activaTab('exampleTopComponents');
                            }
            });
            
            //activate tab when click on bak button    
                $("#tumor-back").click(function () {
                    activaTab('exampleTopHome');
                });
            
        ////////////////// Tab Change /////////////////////////////////

        ////////// Copy Text from Permanent Address to Contact Address when user checked the check box  /////////////
        $('#same_as_above').change(function () {
            if ($(this).is(":checked")) {

                var permanent_address = document.getElementById("fld_permanent_address").value;
                $("#fld_contact_address").val(permanent_address);

            }
        });


        ///////////////////////////// Multiple Family Members ///////////////////////////////////////////

        // Show Add Multiple Value option when user checked 'Yes'
        $('#fld_family_member_yes').change(function () {
            if ($(this).is(":checked")) {
                document.getElementById("family_member_multiple").removeAttribute("hidden");

            }
        });
        
        // Hide Add Multiple Value option when user checked 'No'
        $('#fld_family_member_no').change(function () {
            if ($(this).is(":checked")) {
                document.getElementById("family_member_multiple").setAttribute("hidden", "hidden");
            }
        });

        var iCntMember = 1;
        var row_count_family_member = parseInt($("#row_count_family_member").val());

        $('#btnAddMember').on("click", function () {

            iCntMember = iCntMember + 1;
            row_count_family_member += 1;
            $("#row_count_family_member").val(row_count_family_member);

            $("#family_member_multiple").append('<div class="row" id="row_family_member_' + iCntMember + '"><br>\n\
        <div class="col-sm-3 col-lg-offset-3"><input type="text" class="form-control" name="relationship_' + iCntMember + '" placeholder="Relationship" autocomplete="off"/>\n\
        </div>\n\
        <div class="col-sm-3"><input type="text" class="form-control" name="site_of_cancer_' + iCntMember + '" placeholder="Site of Cancer" autocomplete="off"/></div>\n\
        </div>');
        });

        $('#btnRemoveMember').click(function () {   // REMOVE ELEMENTS ONE PER CLICK.
            if (iCntMember != 1) {

                $('#row_family_member_' + iCntMember).remove();
                iCntMember = iCntMember - 1;
                row_count_family_member -= 1;
                $("#row_count_family_member").val(row_count_family_member);
            }
        });

        ///////////////////////////// Multiple Family Members End ///////////////////////////////////////////

        ///////////////////////////// Multiple Primary ///////////////////////////////////////////

        // Show Add Multiple Value option when user checked 'Yes'
        $('#fld_multiple_primary_yes').change(function () {
            if ($(this).is(":checked")) {
                document.getElementById("multiple_primary").removeAttribute("hidden");

            }
        });
        
        // Hide Add Multiple Value option when user checked 'No'
        $('#fld_multiple_primary_no').change(function () {
            if ($(this).is(":checked")) {
                document.getElementById("multiple_primary").setAttribute("hidden", "hidden");
            }
        });
        
        var iCntMultiplePrimary = 1;
        var row_count_multiple_primary = parseInt($("#row_count_multiple_primary").val());
        
         $('#btnAddMultiplePrimary').on("click", function () {

            iCntMultiplePrimary = iCntMultiplePrimary + 1;
            row_count_multiple_primary += 1;
            $("#row_count_multiple_primary").val(row_count_multiple_primary);

            $("#multiple_primary").append('<div class="row" id="row_multiple_primary_' + iCntMultiplePrimary + '"><br>\n\
        <div class="col-sm-2 col-lg-offset-3"><input type="text" class="form-control" name="site_'+iCntMultiplePrimary+'" placeholder="Site" autocomplete="off"/>\n\
        </div>\n\
        <div class="col-sm-2"><input type="text" class="form-control" name="histology_'+iCntMultiplePrimary+'" placeholder="Type/Histology" autocomplete="off"/></div>\n\
        <div class="col-sm-2"> <div class="input-group"><span class="input-group-addon"><i class="icon wb-calendar" aria-hidden="true"></i></span>\n\
         <input type="text" class="form-control" name="date_of_diagnosis_'+iCntMultiplePrimary+'" placeholder="Date of Diagnosis" data-plugin="datepicker"> </div> </div></div>');
        });

        $('#btnRemoveMultiplePrimary').click(function () {   // REMOVE ELEMENTS ONE PER CLICK.
            if (iCntMultiplePrimary != 1) {

                $('#row_multiple_primary_' + iCntMultiplePrimary).remove();
                iCntMultiplePrimary = iCntMultiplePrimary - 1;
                row_count_multiple_primary -= 1;
                $("#row_count_multiple_primary").val(row_count_multiple_primary);
            }
        });

        ///////////////////////////// Multiple Primary End ///////////////////////////////////////////
        
       
        ///////////////////////////// Recurrence ///////////////////////////////////////////

        // Show Add Multiple Value option when user checked 'Yes'
        $('#fld_recurrence_yes').change(function () {
            if ($(this).is(":checked")) {
                document.getElementById("recurrence").removeAttribute("hidden");

            }
        });
        
        // Hide Add Multiple Value option when user checked 'No'
        $('#fld_recurrence_no').change(function () {
            if ($(this).is(":checked")) {
                document.getElementById("recurrence").setAttribute("hidden", "hidden");
            }
        });
        
        var iCntRecurrence = 1;
        var row_count_recurrence = parseInt($("#row_count_recurrence").val());
        
         $('#btnAddRecurrence').on("click", function () {

            iCntRecurrence = iCntRecurrence + 1;
            row_count_recurrence += 1;
            $("#row_count_recurrence").val(row_count_recurrence);

            $("#recurrence").append('<div class="row" id="row_recurrence_' + iCntRecurrence + '"><br>\n\
        <div class="col-sm-3 col-lg-offset-3"><input type="text" class="form-control" name="site_'+iCntRecurrence+'" placeholder="Site" autocomplete="off"/>\n\
        </div>\n\
        <div class="col-sm-3"> <div class="input-group"><span class="input-group-addon"><i class="icon wb-calendar" aria-hidden="true"></i></span>\n\
         <input type="text" class="form-control" name="date_of_diagnosis_'+iCntRecurrence+'" placeholder="Date of Diagnosis" data-plugin="datepicker"> </div> </div></div>');
        });

        $('#btnRemoveRecurrence').click(function () {   // REMOVE ELEMENTS ONE PER CLICK.
            if (iCntRecurrence != 1) {

                $('#row_recurrence_' + iCntRecurrence).remove();
                iCntRecurrence = iCntRecurrence - 1;
                row_count_recurrence -= 1;
                $("#row_count_recurrence").val(row_count_recurrence);
            }
        });

        ///////////////////////////// Recurrence End ///////////////////////////////////////////     



        $("#patient_details_form").submit(function (event) {

            if ($('#patient_details_submit').attr("disabled"))
            {

            }
            else {

                //    $("#exampleTopHome").tabs("select","#exampleTopComponents");
                $("exampleTopHome").tabs("option", "active", "#exampleTopComponents");
//                $("#patient_details_tab").removeClass("active");
//                $("#tumor_details_tab").addClass("active");
//                $.post("FormServlet", $(this).serialize(), function(rs) {
//                    alert(rs);
//                }).done(function() {
//
//                });
            }

//                     var jqxhr = $.post( "FormServlet", function() {
//                      alert( "success" );
//                    })
//                      .done(function() {
//                        alert( "second success" );
//                      })
//                      .fail(function() {
//                        alert( "error" );
//                      })
//                      .always(function() {
//                        alert( "finished" );
//                    });

//                    // Perform other work here ...
//
//                    // Set another completion function for the request above
//                    jqxhr.always(function() {
//                      alert( "second finished" );
//                    });


        });


        $(document).ready(function ($) {
            Site.run();
        });



        // Example Wizard Form
        // -------------------
        (function () {
            // set up formvalidation
            $('#exampleAccountForm').formValidation({
                framework: 'bootstrap',
                fields: {
                    username: {
                        validators: {
                            notEmpty: {
                                message: 'The username is required'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: 'The username must be more than 6 and less than 30 characters long'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_\.]+$/,
                                message: 'The username can only consist of alphabetical, number, dot and underscore'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: 'The password is required'
                            },
                            different: {
                                field: 'username',
                                message: 'The password cannot be the same as username'
                            }
                        }
                    }
                }
            });

            $("#exampleBillingForm").formValidation({
                framework: 'bootstrap',
                fields: {
                    number: {
                        validators: {
                            notEmpty: {
                                message: 'The credit card number is required'
                            }
                            // creditCard: {
                            //   message: 'The credit card number is not valid'
                            // }
                        }
                    },
                    cvv: {
                        validators: {
                            notEmpty: {
                                message: 'The CVV number is required'
                            }
                            // cvv: {
                            //   creditCardField: 'number',
                            //   message: 'The CVV number is not valid'
                            // }
                        }
                    }
                }
            });

            // init the wizard
            var defaults = $.components.getDefaults("wizard");
            var options = $.extend(true, {}, defaults, {
                buttonsAppendTo: '.panel-body'
            });

            var wizard = $("#exampleWizardForm").wizard(options).data(
                    'wizard');

            // setup validator
            // http://formvalidation.io/api/#is-valid
            wizard.get("#exampleAccount").setValidator(function () {
                var fv = $("#exampleAccountForm").data('formValidation');
                fv.validate();

                if (!fv.isValid()) {
                    return false;
                }

                return true;
            });

            wizard.get("#exampleBilling").setValidator(function () {
                var fv = $("#exampleBillingForm").data('formValidation');
                fv.validate();

                if (!fv.isValid()) {
                    return false;
                }

                return true;
            });
        })();

        // Example Wizard Form Container
        // -----------------------------
        // http://formvalidation.io/api/#is-valid-container
        (function () {
            var defaults = $.components.getDefaults("wizard");
            var options = $.extend(true, {}, defaults, {
                onInit: function () {
                    $('#exampleFormContainer').formValidation({
                        framework: 'bootstrap',
                        fields: {
                            username: {
                                validators: {
                                    notEmpty: {
                                        message: 'The username is required'
                                    }
                                }
                            },
                            password: {
                                validators: {
                                    notEmpty: {
                                        message: 'The password is required'
                                    }
                                }
                            },
                            number: {
                                validators: {
                                    notEmpty: {
                                        message: 'The credit card number is not valid'
                                    }
                                }
                            },
                            cvv: {
                                validators: {
                                    notEmpty: {
                                        message: 'The CVV number is required'
                                    }
                                }
                            }
                        }
                    });
                },
                validator: function () {
                    var fv = $('#exampleFormContainer').data(
                            'formValidation');

                    var $this = $(this);

                    // Validate the container
                    fv.validateContainer($this);

                    var isValidStep = fv.isValidContainer($this);
                    if (isValidStep === false || isValidStep === null) {
                        return false;
                    }

                    return true;
                },
                onFinish: function () {
                    // $('#exampleFormContainer').submit();
                },
                buttonsAppendTo: '.panel-body'
            });

            $("#exampleWizardFormContainer").wizard(options);
        })();

        // Example Wizard Pager
        // --------------------------
        (function () {
            var defaults = $.components.getDefaults("wizard");

            var options = $.extend(true, {}, defaults, {
                step: '.wizard-pane',
                templates: {
                    buttons: function () {
                        var options = this.options;
                        return
                        '<div class="btn-group" aria-label="Wizard Pager" role="group">' +
                                '<button class="btn btn-default btn-outline" data-target="#' +
                                this.id +
                                '" data-wizard="back" data-page="' + page_name + '"><i class="icon wb-chevron-left" aria-hidden="true"></i></button>' +
                                '<button class="btn btn-default btn-outline" data-target="#' +
                                this.id +
                                '" data-wizard="next"  data-page="' + page_name + '"><i class="icon wb-chevron-right" aria-hidden="true"></i></button>' +
                                '<button class="btn btn-default btn-outline" data-target="#' +
                                this.id +
                                '" data-wizard="finish"  data-page="' + page_name + '"><i class="icon wb-check" aria-hidden="true"></i></button>' +
                                '</div>';
                    }
                },
                buttonsAppendTo: '.panel-actions'
            });

            $("#exampleWizardPager").wizard(options);
        })();

        // Example Wizard Progressbar
        // --------------------------
        (function () {
            var defaults = $.components.getDefaults("wizard");

            var options = $.extend(true, {}, defaults, {
                step: '.wizard-pane',
                onInit: function () {
                    this.$progressbar = this.$element.find('.progress-bar')
                            .addClass('progress-bar-striped');
                },
                onBeforeShow: function (step) {
                    step.$element.tab('show');
                },
                onFinish: function () {
                    this.$progressbar.removeClass('progress-bar-striped').addClass(
                            'progress-bar-success');
                },
                onAfterChange: function (prev, step) {
                    var total = this.length();
                    var current = step.index + 1;
                    var percent = (current / total) * 100;

                    this.$progressbar.css({
                        width: percent + '%'
                    }).find('.sr-only').text(current + '/' + total);
                },
                buttonsAppendTo: '.panel-body'
            });

            $("#exampleWizardProgressbar").wizard(options);
        })();

        // Example Wizard Tabs
        // -------------------
        (function () {
            var defaults = $.components.getDefaults("wizard");
            var options = $.extend(true, {}, defaults, {
                step: '> .nav > li > a',
                onBeforeShow: function (step) {
                    step.$element.tab('show');
                },
                classes: {
                    step: {
                        //done: 'color-done',
                        error: 'color-error'
                    }
                },
                onFinish: function () {
                    alert('finish');
                },
                buttonsAppendTo: '.tab-content'
            });

            $("#exampleWizardTabs").wizard(options);
        })();

        // Example Wizard Accordion
        // ------------------------
        (function () {
            var defaults = $.components.getDefaults("wizard");
            var options = $.extend(true, {}, defaults, {
                step: '.panel-title[data-toggle="collapse"]',
                classes: {
                    step: {
                        //done: 'color-done',
                        error: 'color-error'
                    }
                },
                templates: {
                    buttons: function () {
                        return '<div class="panel-footer">' + defaults.templates
                                .buttons.call(this) + '</div>';
                    }
                },
                onBeforeShow: function (step) {
                    step.$pane.collapse('show');
                },
                onBeforeHide: function (step) {
                    step.$pane.collapse('hide');
                },
                onFinish: function () {
                    alert('finish');
                },
                buttonsAppendTo: '.panel-collapse'
            });

            $("#exampleWizardAccordion").wizard(options);
        })();


    })(document, window, jQuery);


</script>-->
