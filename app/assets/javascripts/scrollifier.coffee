$ ->
  $.scrollify
    section: '.project-display-container'
    sectionName: 'section-name'
    scrollSpeed: 900
    scrollbars: false
    setHeights: false
    before: ->
      gradient = $('.project-display-gradient')
      sections = $('.project-display-container')
      section = $.scrollify.current()
      sections.removeClass('project-display-active')
      section.addClass('project-display-active')
      if section.hasClass('formnflow')
        gradient.removeClass('hatcher')
        gradient.addClass('formnflow')
      else if section.hasClass('hatcher')
        gradient.removeClass('formnflow')
        gradient.addClass('hatcher')
  return
