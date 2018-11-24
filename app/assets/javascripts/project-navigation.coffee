# $('.page-wrapper.home').ready ->
#   # Element & Time Counter Variables
#   timoutCount = 10000
#   timerTrigger = undefined
#   interval = undefined
#   navigation = document.querySelector('.project-navigation')
#   arrowPrev = document.querySelector('.project-navigation-arrow.prev')
#   arrowNext = document.querySelector('.project-navigation-arrow.next')
#
#   # Functions
#   IdleTrigger = ->
#     navigation.className += ' idle'
#
#   StartTimers = ->
#     timerTrigger = setTimeout(IdleTrigger, timoutCount)
#
#   ResetTimers = ->
#     navigation.classList.remove 'idle'
#     clearTimeout timerTrigger
#     StartTimers()
#
#   # Begin Timer On Page Load
#   StartTimers()
#
#   # Reset Time Counter At Any Browser Interaction
#   $(document).bind 'mousemove keydown scroll', ->
#     ResetTimers()
#
#   # Hover triggers
#   arrowPrev.onmouseover = ->
#     this.nextElementSibling.className += ' inactive'
#     interval = setInterval(ResetTimers, 3000)
#
#   arrowPrev.onmouseout = ->
#     this.nextElementSibling.classList.remove 'inactive'
#     clearInterval(interval)
#
#   arrowNext.onmouseover = ->
#     this.previousElementSibling.className += ' inactive'
#     interval = setInterval(ResetTimers, 3000)
#
#   arrowNext.onmouseout = ->
#     this.previousElementSibling.classList.remove 'inactive'
#     clearInterval(interval)
#
#   # Click triggers
#   arrowPrev.onclick = ->
#     $.scrollify.previous()
#
#   arrowNext.onclick = ->
#     $.scrollify.next()
