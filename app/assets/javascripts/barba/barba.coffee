$(document).ready ->
  FadeTransition = Barba.BaseTransition.extend(
    start: ->
      # This function is automatically called as soon the Transition starts. this.newContainerLoading is a Promise for the loading of the new container
      # (Barba.js also comes with an handy Promise polyfill!). As soon the loading is finished and the old page is faded out, let's fade the new page
      Promise.all([
        @newContainerLoading
        @fadeOut()
      ]).then @fadeIn.bind(this)

    fadeOut: ->
      $(@oldContainer).animate(opacity: 0).promise()
      # this.oldContainer is the HTMLElement of the old Container

    fadeIn: ->
      # this.newContainer is the HTMLElement of the new Container
      # At this stage newContainer is on the DOM (inside our #barba-container and with visibility: hidden). Please note, newContainer is available just after newContainerLoading is resolved!
      # Do not forget to call .done() as soon your transition is finished! .done() will automatically remove from the DOM the old Container
      _this = this
      $el = $(@newContainer)
      $(@oldContainer).hide()
      $el.css
        visibility: 'visible'
        opacity: 0
      $el.animate { opacity: 1 }, 250, ->
        _this.done()
  )

  # Next step, you have to tell Barba to use the new Transition. Here you can use your own logic! For example you can use different Transition based on the current page or link...
  Barba.Pjax.getTransition = ->
    FadeTransition
  Barba.Pjax.start()
