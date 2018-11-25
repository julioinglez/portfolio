$(document).ready ->
  swiper = new Swiper('.swiper-container',
    direction: 'vertical'
    slidesPerView: 1
    mousewheel: true
    keyboard: true
    hashNavigation:
      watchState: true
      replaceState: true
    loop: true
  )

  # Gradient Background Colour Transition
  slides = 'welcome formnflow hatcher nexus-pattern speedy-vocab'
  grandient = $('.dynamic-gradient')
  swiper.on 'slideChangeTransitionStart', ->
    hash = $('.swiper-slide-active').data('hash')
    grandient.removeClass(slides)
    grandient.addClass(hash)
