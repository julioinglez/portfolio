$ ->
  logo = $('.logo-icon.contrast')
  gradient = $('.project-display-gradient')
  allSections = $('.project-display-container')

  $.scrollify
    section: '.project-display-container'
    sectionName: 'section-name'
    scrollSpeed: 900

    before: ->
      section = $.scrollify.current()
      allSections.removeClass('active')
      gradient.removeClass('welcome hatcher formnflow nexus-pattern speedy-vocab')
      section.addClass('active')
      logo.addClass('active')
      if section.hasClass('welcome')
        logo.removeClass('active')
        gradient.addClass('welcome')
      else if section.hasClass('formnflow')
        gradient.addClass('formnflow')
      else if section.hasClass('hatcher')
        gradient.addClass('hatcher')
      else if section.hasClass('speedy-vocab')
        gradient.addClass('speedy-vocab')
      else if section.hasClass('nexus-pattern')
        gradient.addClass('nexus-pattern')

      # Project Navigation
      navigation = $('.project-navigation')
      if section.hasClass('last-child')
        navigation.addClass('last')
      else if section.hasClass('first-child')
        navigation.addClass('first')
      else
        navigation.removeClass('last')
        navigation.removeClass('first')

  section = $.scrollify.current()
  allSections.first().addClass('first-child')
  allSections.last().addClass('last-child')
  if section.hasClass('welcome')
    gradient.addClass('welcome')

  document.querySelector('.work').onclick = ->
    $.scrollify.next()

  # Always take User to top section on page load
  $.scrollify.move(0)

  # Disable Scrollify & Scrollbar
  $.scrollify.disable();
  document.querySelector('body').className += ' disable-scrollbar'
  document.querySelector('.project-display-container.welcome').classList.remove 'active'

  # Disable browser scrolling until progress bar loads
  keys =
    37: 1
    38: 1
    39: 1
    40: 1

  preventDefault = (e) ->
    e = e or window.event
    if e.preventDefault
      e.preventDefault()
    e.returnValue = false

  preventDefaultForScrollKeys = (e) ->
    if keys[e.keyCode]
      preventDefault e
      return false

  disableScroll = ->
    if window.addEventListener
      window.addEventListener 'DOMMouseScroll', preventDefault, false
    window.onwheel = preventDefault
    # modern standard
    document.onmousewheel = preventDefault
    # older browsers, IE
    window.ontouchmove = preventDefault
    # mobile
    document.onkeydown = preventDefaultForScrollKeys

  disableScroll()
