$ ->
  # Set timeout idle time
  timoutCount = 10000
  timerTrigger = undefined
  Interval = undefined

  IdleTrigger = ->
    $('.project-navigation').addClass('idle')

  StartTimers = ->
    timerTrigger = setTimeout(IdleTrigger, timoutCount)

  ResetTimers = ->
    $('.project-navigation').removeClass('idle')
    clearTimeout timerTrigger
    StartTimers()

  StartTimers()

  $(document).bind 'mousemove keypress keydown scroll', ->
    ResetTimers()

  $('.project-navigation-arrow.next, .project-navigation-arrow.prev').on('mouseenter', ->
    Interval = setInterval(ResetTimers, 3000)
  ).on 'mouseleave', ->
    clearInterval(Interval)

  # Hover triggers
  $('.project-navigation-arrow.next').hover (->
    $(@).prev('.prev').addClass 'inactive'
  ), ->
    $(@).prev('.prev').removeClass 'inactive'

  $('.project-navigation-arrow.prev').hover (->
    $(@).next('.next').addClass 'inactive'
  ), ->
    $(@).next('.next').removeClass 'inactive'

  document.querySelector('.project-navigation-arrow.next').onclick = ->
    $.scrollify.next()

  document.querySelector('.project-navigation-arrow.prev').onclick = ->
    $.scrollify.previous()
