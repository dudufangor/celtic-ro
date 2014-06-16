$(".slip").click ->
  $("html, body").animate
    scrollTop: $("#informations").offset(), 700

$(".bt_highlights").click (e) ->
  e.preventDefault()
  $("html, body").animate
    scrollTo: $("#highlights").offset(,, 700

$(".bt_server_information").click (e) ->
  e.preventDefault()
  $("html, body").animate
    scrollTo: $("#informations").offset(,, 700

$(".bt_eventos").click (e) ->
  e.preventDefault()
  $("html, body").animate
    scrollTo: $("#extra_informations").offset(,, 700

$(".bt_registro").click (e) ->
  e.preventDefault()
  $("html, body").animate
    scrollTo: $("#join").offset(,, 700

$(".bt_contato").click (e) ->
  e.preventDefault()
  $("html, body").animate
    scrollTo: $("#footer").offset(,, 700