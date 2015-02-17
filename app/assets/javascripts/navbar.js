$(document).ready(function(){
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();

        if (scroll <= 400) {
            $('#logo-image').attr('src', '/images/General/TC_Logo.svg');
            $('.shrinking').addClass('topbar-padding');
            $('h1 img').css('margin-right', '230px')
        }
        if (scroll > 400) {
            $('.shrinking').removeClass('topbar-padding');
            $('#logo-image').attr('src', '/images/General/Sml_Logo.svg');
            $('h1 img').css('margin-right', '350px')
        }
    });
});

// $(function(){
//     $('#header_nav').data('size','big');
// });

// $(window).scroll(function(){
//     if($(document).scrollTop() > 0)
//     {
//         if($('#header_nav').data('size') == 'big')
//         {
//             $('#header_nav').data('size','small');
//             $('#header_nav').stop().animate({
//                 height:'40px'
//             },600);
//         }
//     }
//     else
//     {
//         if($('#header_nav').data('size') == 'small')
//         {
//             $('#header_nav').data('size','big');
//             $('#header_nav').stop().animate({
//                 height:'100px'
//             },600);
//         }
//     }
// });