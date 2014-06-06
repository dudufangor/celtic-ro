$(".footer").click ->
  $("html, body").animate
    scrollTop: $("#informations").offset().top , 700