 $(document).ready(function()
  {

    $( ".bt_highlights" ).click(function() {
      $('html, body').animate({scrollTop:$('.highlights').position().top}, 1100);
    });

    $( ".bt_server_information" ).click(function() {
      $('html, body').animate({scrollTop:$('#informations').position().top}, 1100);
    });

    $( ".bt_extra_information" ).click(function() {
      $('html, body').animate({scrollTop:$('.extra_informations').position().top}, 1100);
    });

    $( ".bt_join_game" ).click(function() {
      $('html, body').animate({scrollTop:$('#join').position().top}, 1100);
    });

    $( ".bt_footer" ).click(function() {
      $('html, body').animate({scrollTop:$('.footer').position().top}, 1100);
    });
});