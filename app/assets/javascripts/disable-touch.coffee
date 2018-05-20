$(document.body).on 'touchmove', (event) ->
  event.preventDefault()
  event.stopPropagation()
  return
