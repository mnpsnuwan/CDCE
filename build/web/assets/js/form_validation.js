 // Example Validataion Standard Mode
      // ---------------------------------
      (function() {
       
          $('#login_form').formValidation({
          framework: "bootstrap",
          button: {
            selector: '#login_button',
            disabled: 'disabled'
          },
          icon: null,
          fields: {
            inputUsername: {
              validators: {
                notEmpty: {
                  message: 'The Username is required and cannot be empty'
                }
              }
            },
            inputPassword: {
              validators: {
                notEmpty: {
                  message: 'The Password is required and cannot be empty'
                }
              }
            }
          }
        });
       
//         $('#').formValidation({
//          framework: "bootstrap",
//          fields: {
//            title: {
//              validators: {
//                notEmpty: {
//                  message: 'This field is required and cannot be empty'
//                }
//              }
//            },
//            full_name: {
//              validators: {
//                notEmpty: {
//                  message: 'This field is required and cannot be empty'
//                }
//              }
//            }
//                     
//          }
//        });
//        
//        
      })();