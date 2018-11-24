$(document).ready ->
  swiper = new Swiper('.swiper-container',
    direction: 'vertical'
    slidesPerView: 1
    mousewheel: true
    cssWidthandHeight: true
    pagination:
      el: '.swiper-pagination'
      clickable: true)
