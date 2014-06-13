class window.ContentSlider
  constructor: ->

    $carousel = undefined
    $carouselNavigation = undefined
    firstSlide = undefined
    $carousel = $("#carousel")
    $carouselNavigation = $("#carousel-navigation")
    firstSlide = $carouselNavigation.find(">:first-child a").attr("href")
    $carouselNavigation.on "click", "a", (event) ->
      selectedSlide = undefined
      event.preventDefault()
      selectedSlide = $(this).attr("href")
      $carousel.find(".slide").removeClass "active animated fadeInLeft"
      $carouselNavigation.find("a").removeClass "active"
      $(this).addClass "active"
      $carousel.find("." + selectedSlide).addClass "active animated fadeInLeft"
      return

    $carousel.find("." + firstSlide).addClass "active animated fadeInLeft"