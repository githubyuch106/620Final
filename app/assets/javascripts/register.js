
$(document).ready(register);


function register(){
    $('#signUpForm').submit( function (e) {

        //preventing default behaviour

        e.preventDefault();

        //Checking if password and confirm password matches

        if($('#password').val() != $('#confirm_password').val()){
            $('#signUpError').removeClass("hidden").addClass("alert-danger").html("Passwords donot match.");
            $('#password').val("");
            $('#confirm_password').val("");
            $('#password').focus();
        }
        else {
            //Getting radio button value from registration form
            var value = $('input[name="user_type"]:checked').val();

            $.ajax({
                "type": "post",
                "url": "/member/register_post",
                data : { first_name: $("#firstName").val(), last_name: $("#lastName").val(), email: $("#email").val(), password: $("#password").val(), address: $("#address").val(), contact: $("#contact").val() },
                success: function (response) {
                    if(response.status == 0){
                        $("#signUpError").removeClass("hidden alert-success").addClass("alert-danger").html("Fill all the fields");
                    }else{
                        $("#signUpError").removeClass("hidden alert-danger").addClass("alert-success").html("User created Successfully");

                        location.href = "/book/index";
                    }
                }
            })
        }
    })
}
