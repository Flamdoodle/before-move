$(document).ready(function(){
    $(".submit-login").click(function(e) {
        e.preventDefault();

        $("#login-form").submit();
    });
});