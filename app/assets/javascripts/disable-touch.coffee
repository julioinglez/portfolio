$ ->
  $(document.body).on 'touchmove', (event) ->
    event.preventDefault()
    event.stopPropagation()
    return

  document.ontouchmove = (e) ->
    e.preventDefault()
    return
