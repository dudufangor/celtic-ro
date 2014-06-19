$('.show_commands').mouseover (e) ->
  e.preventDefault()
  $('.commands').addClass 'active fadeInLeft'

$('.show_commands').mouseout  (e) ->
  e.preventDefault()
  $('.commands').removeClass 'active fadeInLeft'