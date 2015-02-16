$(document).ready(function(){
    console.log("ready");
    $(window).scroll(function() {
        console.log("scrolling");

        if (scroll >= 50) {
            $('#logo-image').attr('src', '/public/images/General/TC_Logo.svg');
            $('.top-bar').addClass('topbar-padding');
        }
        if (scroll < 50) {
            $('.top-bar').removeClass('topbar-padding');
            $('#logo-image').attr('src', '/public/images/General/Sml_Logo.svg');
        }
    });
});