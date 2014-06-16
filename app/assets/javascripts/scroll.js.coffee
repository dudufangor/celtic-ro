$(".slip").click ->
  $("html, body").animate
    scrollTop: $("#informations").offset().top , 700
    console.log "stfu! im scrolling bitches"