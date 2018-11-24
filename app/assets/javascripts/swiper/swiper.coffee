$(document).ready ->
  mySwiper = new Swiper('.swiper-container',
    direction: 'vertical'
    slidesPerView: 1
    mousewheel: true
    keyboard: true
    scrollbar: true
    clickable: true
    loop: true
    pagination:
      el: '.swiper-pagination'
      clickable: true)
