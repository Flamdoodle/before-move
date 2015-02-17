$(document).ready(function(){
    $(".submit-inquiry").click(function(e) {
        e.preventDefault();

        $(".new_inquery").submit();
    });
});