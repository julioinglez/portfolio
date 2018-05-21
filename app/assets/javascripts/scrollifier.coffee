$ ->
  # $('.work')

  $.scrollify
    section: '.project-display-container'
    sectionName: 'section-name'
    scrollSpeed: 900

    before: ->
      logo = $('.logo-icon.contrast')
      gradient = $('.project-display-gradient')
      allSections = $('.project-display-container')
      section = $.scrollify.current()
      allSections.removeClass('active')
      gradient.removeClass('active welcome hatcher formnflow nexus-pattern speedy-vocab')
      section.addClass('active')
      section.prev(gradient).addClass('active')
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

  section = $.scrollify.current()
  gradient = $('.project-display-gradient')
  if section.hasClass('welcome')
    gradient.addClass('welcome')


  # Keep browser scrolling disabled until progress bar loads

  # document.location.hash = '#/welcome'
  $.scrollify.move(0)

  # Disable Scrollify
  $.scrollify.disable();

  # Disable Native Scrolling
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
    return

  preventDefaultForScrollKeys = (e) ->
    if keys[e.keyCode]
      preventDefault e
      return false
    return

  disableScroll = ->
    if window.addEventListener
      window.addEventListener 'DOMMouseScroll', preventDefault, false
    window.onwheel = preventDefault
    # modern standard
    window.onmousewheel = document.onmousewheel = preventDefault
    # older browsers, IE
    window.ontouchmove = preventDefault
    # mobile
    document.onkeydown = preventDefaultForScrollKeys
    return

  enableScroll = ->
    if window.removeEventListener
      window.removeEventListener 'DOMMouseScroll', preventDefault, false
    window.onmousewheel = document.onmousewheel = null
    window.onwheel = null
    window.ontouchmove = null
    document.onkeydown = null
    return

  disableScroll()
