
$(document).ready(function() {
    $('#patient_details_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            fld_consultant: {
//                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The consultant is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 4,
                        max: 30,
                        message: 'The consultant must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The consultant can only consist of alphabetical, number, dot and underscore'
                    }
                }
            },
            fld_clinic_file_no: {
                validators: {
                    notEmpty: {
                        message: 'The clinic file no is required and can\'t be empty'
                    }
                }
            },
            fld_date_of_registration: {
                validators: {
                    notEmpty: {
                        message: 'The date of registration is required and can\'t be empty'
                    }
                }
            },
            fld_surname: {
                validators: {
                    notEmpty: {
                        message: 'The surname is required and can\'t be empty'
                    }
                }
            },
            fld_date_of_birth: {
                validators: {
                    notEmpty: {
                        message: 'The date of birth is required and can\'t be empty'
                    }
                }
            },
            fld_age: {
                validators: {
                    notEmpty: {
                        message: 'The age is required and can\'t be empty'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'The age can only consist of number'
                    },
                    lessThan: {
                        value: 100,
                        inclusive: true,
                        message: 'The ages has to be less than 100'
                    },
                    greaterThan: {
                        value: 0,
                        inclusive: false,
                        message: 'The ages has to be greater than or equals to 1'
                    }
                }
            },
            fld_sex: {
                validators: {
                    notEmpty: {
                        message: 'The gender is required and can\'t be empty'
                    }
                }
            },
            fld_permanent_address: {
                validators: {
                    notEmpty: {
                        message: 'The permanent address is required and can\'t be empty'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and can\'t be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            website: {
                validators: {
                    uri: {
                        allowLocal: true,
                        message: 'The input is not a valid URL'
                    }
                }
            },
            phoneNumberUS: {
                validators: {
                    phone: {
                        message: 'The input is not a valid US phone number'
                    }
                }
            },
            phoneNumberUK: {
            	validators: {
            		phone: {
            			message: 'The input is not a valid UK phone number',
            			country: 'GB'
            		}
            	}
            },
            color: {
                validators: {
                    hexColor: {
                        message: 'The input is not a valid hex color'
                    }
                }
            },
            zipCode: {
                validators: {
                    zipCode: {
                        country: 'US',
                        message: 'The input is not a valid US zip code'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            ages: {
                validators: {
                    lessThan: {
                        value: 100,
                        inclusive: true,
                        message: 'The ages has to be less than 100'
                    },
                    greaterThan: {
                        value: 10,
                        inclusive: false,
                        message: 'The ages has to be greater than or equals to 10'
                    }
                }
            }
        }
    });
});
