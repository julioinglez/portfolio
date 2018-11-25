$(document).ready ->

  # Setup Swiper
  swiper = new Swiper('.swiper-container',
    init: false
    direction: 'vertical'
    slidesPerView: 1
    mousewheel: true
    keyboard: true
    threshold: 15
    hashNavigation:
      watchState: true
      replaceState: true
    loop: true
    navigation:
      nextEl: '.swipe-next'
      prevEl: '.swipe-prev'
  )

  # Only Run Swiper On Home Page
  $('body.home').ready ->
    swiper.init()

  # Target Navigation Arrows
  nextArrow = $('.navigation-arrow.next')
  prevArrow = $('.navigation-arrow.prev')

  # Activate Navigation Styles For "Next Arrow "On Slide Change
  swiper.on 'slideNextTransitionStart', ->
    nextArrow.addClass('active')

  # Activate Navigation Styles For "Prev Arrow "On Slide Change
  swiper.on 'slidePrevTransitionStart', ->
    prevArrow.addClass('active')

  # Remove Activate Navigation Styles From "Next/Prev Arrows "At End Of Slide Change
  swiper.on 'transitionEnd', ->
    nextArrow.removeClass('active')
    prevArrow.removeClass('active')

  slides = 'welcome formnflow hatcher nexus-pattern speedy-vocab'
  grandient = $('.dynamic-gradient')
  logo = $('.logo-container')
  swiper.on 'slideChangeTransitionStart', ->

    # Gradient Background Colour Transition
    hash = $('.swiper-slide-active').data('hash')
    grandient.removeClass(slides)
    grandient.addClass(hash)

    # Logo Colour Transition
    logoClass = 'white'
    if hash != 'welcome'
      logo.addClass(logoClass)
    else
      logo.removeClass(logoClass)
