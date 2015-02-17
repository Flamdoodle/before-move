$(document).ready(function(){
    $(".submit-inquiry").click(function() {
        $(this).parents('form:first').submit();
    });
});