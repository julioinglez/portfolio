# $('.page-wrapper.home').ready ->
#
#   # Disable browser scrolling until progress bar loads
#   keys = 37: 1, 38: 1, 39: 1, 40: 1
#
#   preventDefault = (e) ->
#     e = e or window.event
#     if e.preventDefault
#       e.preventDefault()
#     e.returnValue = false
#
#   preventDefaultForScrollKeys = (e) ->
#     if keys[e.keyCode]
#       preventDefault e
#       return false
#
#   disableScroll = ->
#     if window.addEventListener
#       window.addEventListener 'DOMMouseScroll', preventDefault, false
#     window.onwheel = preventDefault
#     document.onmousewheel = preventDefault
#     window.ontouchmove = preventDefault
#     document.onkeydown = preventDefaultForScrollKeys
#
#   disableScroll()
