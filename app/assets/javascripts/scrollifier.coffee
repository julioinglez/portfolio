$ ->
  $.scrollify
    section: '.project-display-container'
    sectionName: 'section-name'
    scrollSpeed: 900
    before: ->
      gradient = $('.project-display-gradient')
      allSections = $('.project-display-container')
      section = $.scrollify.current()
      allSections.removeClass('active')
      gradient.removeClass('active hatcher formnflow nexus-pattern speedy-vocab')
      section.addClass('active')
      section.prev(gradient).addClass('active')
      if section.hasClass('formnflow')
        gradient.addClass('formnflow')
      else if section.hasClass('hatcher')
        gradient.addClass('hatcher')
      else if section.hasClass('nexus-pattern')
        gradient.addClass('nexus-pattern')
      else if section.hasClass('speedy-vocab')
        gradient.addClass('speedy-vocab')
  return
