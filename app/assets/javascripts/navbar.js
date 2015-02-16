$(document).ready(function(){
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();

        if (scroll <= 400) {
            $('#logo-image').attr('src', '/images/General/TC_Logo.svg');
            $('.top-bar').addClass('topbar-padding');
        }
        if (scroll > 400) {
            $('.top-bar').removeClass('topbar-padding');
            $('#logo-image').attr('src', '/images/General/Sml_Logo.svg');
        }
    });
});