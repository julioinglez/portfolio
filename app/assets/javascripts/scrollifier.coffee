$ ->
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
      gradient.removeClass('active hatcher formnflow nexus-pattern speedy-vocab')
      section.addClass('active')
      section.prev(gradient).addClass('active')
      logo.addClass('active')
      if section.hasClass('welcome')
        logo.removeClass('active')
      else if section.hasClass('formnflow')
        gradient.addClass('formnflow')
      else if section.hasClass('hatcher')
        gradient.addClass('hatcher')
      else if section.hasClass('speedy-vocab')
        gradient.addClass('speedy-vocab')
      else if section.hasClass('nexus-pattern')
        gradient.addClass('nexus-pattern')
  return
