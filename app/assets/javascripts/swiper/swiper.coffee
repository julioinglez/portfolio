$(document).ready ->
  # Setup Fixed Variables
  homeSwiper = null
  showcaseSwiper = null
  nextArrow = $('.navigation-arrow.next')
  prevArrow = $('.navigation-arrow.prev')
  slides = 'welcome formnflow hatcher nexus-pattern speedy-vocab'
  grandient = $('.dynamic-gradient')
  logo = $('.logo-container')

  # Setup Home Swiper
  loadHome = () ->
    homeSwiper = new Swiper('.swiper-container'
      direction: 'vertical'
      threshold: 15
      loop: true
      mousewheel: true
      keyboard:
        enabled: true
        onlyInViewport: true
      navigation:
        nextEl: '.swipe-next'
        prevEl: '.swipe-prev'
      hashNavigation:
        watchState: true
        replaceState: true
    )

  # Setup Showcase Swiper
  loadShowcase = () ->
    showcaseSwiper = new Swiper('.swiper-container'
      threshold: 15
    )
    showcaseSwiper.prependSlide ['<div class="swiper-slide"></div>']
    showcaseSwiper.appendSlide ['<div class="swiper-slide"></div>']
    showcaseSwiper.allowSlideNext = false

  loadShowcaseBackUrl = () ->
    showcaseSwiper.on 'slidePrevTransitionStart', ->
      host = window.location.host
      protocol = window.location.protocol
      path = window.location.pathname
      hash = path.substr(1)
      url = (protocol + '//' + host + '/#' + hash)
      window.location.href = url

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
    homeSwiper.on 'slideNextTransitionStart', ->
      nextArrow.addClass('active')

    # Activate Navigation Styles For "Prev Arrow "On Slide Change
    homeSwiper.on 'slidePrevTransitionStart', ->
      prevArrow.addClass('active')

    # Remove Activate Navigation Styles From "Next/Prev Arrows "At End Of Slide Change
    homeSwiper.on 'transitionEnd', ->
      nextArrow.removeClass('active')
      prevArrow.removeClass('active')

    # Reload page assets on swipes
    homeSwiper.on 'slideChangeTransitionStart', ->
      loadAssets()

  # Barba Views Home Script
  Home = Barba.BaseView.extend(
    namespace: 'home'
    onEnterCompleted: ->
      loadHome()
      loadAssets()
      loadSwiperTransitions()
  )

  Home.init()

  # Barba Views Home Script
  Showcase = Barba.BaseView.extend(
    namespace: 'showcase'
    onEnterCompleted: ->
      loadShowcase()
      loadAssets()
      loadShowcaseBackUrl()
  )

  Showcase.init()
