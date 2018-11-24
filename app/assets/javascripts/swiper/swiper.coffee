$(document).ready ->
  mySwiper = new Swiper('.swiper-container',
    direction: 'vertical'
    slidesPerView: 1
    mousewheel: true
    keyboard: true
    hashNavigation: true
    loop: true
  )
