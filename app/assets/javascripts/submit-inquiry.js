$(document).ready(function(){
    $(".has-referral-code").click(function(e) {
        e.preventDefault();

        $(".has-referral-code").hide();
        $(".invisible").removeClass("invisible");
    })

    $(".submit-inquiry").click(function(e) {
        e.preventDefault();

        $(".new_inquery").submit();
    });
});