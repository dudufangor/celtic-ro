$(window).scroll(function () {

    if ($(window).scrollTop() >= 565) {
        $('#header').addClass('header--fixed');
    }

    if ($(window).scrollTop() < 565) {
        $('#header').removeClass('header--fixed');
    }
});