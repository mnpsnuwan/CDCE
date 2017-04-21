<!-- Footer -->
<footer class="site-footer" >
    <span class="site-footer-legal">© University of Colombo</span>
    <div class="site-footer-right">

    </div>
</footer>

<!-- Core  -->
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
</script>



</body>

</html>