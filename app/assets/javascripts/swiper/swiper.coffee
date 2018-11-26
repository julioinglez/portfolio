$(document).ready ->
  # Setup Fixed Variables
  swiper = new Swiper('.swiper-container')
  nextArrow = $('.navigation-arrow.next')
  prevArrow = $('.navigation-arrow.prev')
  slides = 'welcome formnflow hatcher nexus-pattern speedy-vocab'
  grandient = $('.dynamic-gradient')
  logo = $('.logo-container')

  # Setup Functions

  # Load swiper params
  loadSwiper = () ->
    if $('.swiper-container').hasClass('home')
      # swiper.destroy()
      swiper = new Swiper('.swiper-container'
        direction: 'vertical'
        threshold: 15
        loop: true
        mousewheel: true
        keyboard: true
        navigation:
          nextEl: '.swipe-next'
          prevEl: '.swipe-prev'
        hashNavigation:
          watchState: true
          replaceState: true
      )
    else if $('.swiper-container').hasClass('showcase')
      # swiper.destroy()
      swiper = new Swiper('.swiper-container'
        freeMode: true
        threshold: 15
      )

  # Load assets and asset transitions
  loadAssets = () ->
    # Get hash data attribute from active slide
    hash = $('.swiper-slide-active').data('hash')

    # Gradient Background Colour Transition
    grandient.removeClass(slides)
    grandient.addClass(hash)

    # Logo Colour Transition
    logoToggle = 'white'
    if hash != 'welcome'
      logo.addClass(logoToggle)
    else
      logo.removeClass(logoToggle)

  # Load swiper slide transitions
  loadSwiperTransitions = () ->
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

    # Reload page assets on swipes
    swiper.on 'slideChangeTransitionStart', ->
      loadAssets()

  # Load functions on page load
  loadSwiper()
  loadAssets()
  loadSwiperTransitions()

  # Barba Page Load
  # Barba.Dispatcher.on 'newPageReady', (currentStatus, oldStatus, container) ->

  # Barba Views Scripts
  Home = Barba.BaseView.extend(
    namespace: 'home'
    onEnter: ->
      console.log 'home page loaded'
      swiper = new Swiper('.swiper-container'
        direction: 'vertical'
        threshold: 50
        loop: true
        mousewheel: true
        keyboard: true
        navigation:
          nextEl: '.swipe-next'
          prevEl: '.swipe-prev'
        hashNavigation:
          watchState: true
          replaceState: true
      )

      loadAssets()

      # TODO: Fix this thing, because it has to run!!
      swiper.on 'slideNextTransitionStart', ->
        nextArrow.addClass('active')
  )

  Home.init()

  Showcase = Barba.BaseView.extend(
    namespace: 'showcase'
    onEnter: ->
      console.log 'showcase page loaded'
      swiper = new Swiper('.swiper-container'
        freeMode: true
        threshold: 50
      )
  )

  Showcase.init()
