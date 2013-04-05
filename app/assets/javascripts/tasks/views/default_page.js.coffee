@PreKix = PreKix ? {}
class PreKix.DefaultPage
  constructor: ->
    @el = '#taskpage-default'
    @setEvents()

  setEvents: ->
    $.pubsub("subscribe", "category_button_click", @handleEvents.bind(this))
    $.pubsub("subscribe", "subtask_button_click", @handleEvents.bind(this))

  handleEvents: (message, context)->
    if message == "category_button_click"
      $(@el).show()
    else if message == "subtask_button_click"
      $(@el).hide()
