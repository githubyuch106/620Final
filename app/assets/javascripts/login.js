
jQuery(document).ready(initLogin);

function initLogin(){
    jQuery("#signInForm").submit( function (e) {
        e.preventDefault();
        jQuery.ajax({
            "type": "post",
            "url": "/member/login_post",
            data : {email: $("#email").val(), password: $("#password").val()},
            success: function (response) {
                if(response.status == 0){
                    $("#signInError").removeClass("hidden alert-success").addClass("alert-danger").html("Email or password is incorrect.");
                }else{
                    $("#signInError").removeClass("hidden alert-danger").addClass("alert-success").html("Successfuly loged in.");
                        location.href = "/book/index"; 
                }
            }
        })
    })
}