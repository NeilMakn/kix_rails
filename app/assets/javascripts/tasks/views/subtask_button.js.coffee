@PreKix = PreKix ? {}
class PreKix.SubtaskButton
  constructor: ->
    @el = '.subtask'
    @setEvents()

  setEvents: ->
    $.pubsub("subscribe", "subtask_button_click", @handleEvents.bind(this))
    $.pubsub("subscribe", "category_button_click", @handleEvents.bind(this))

    $(@el).click (e)->
      context = e.currentTarget
      $.pubsub("publish", "subtask_button_click", context)

  handleEvents: (message, context)->
    if message == "subtask_button_click"
      @deselectOthers(context)
      @setDisplayState(context)

    if message == "category_button_click"
      @deselectAll()

  deselectAll: ->
    @setDeselected(@el)

  deselectOthers: (context)->
    _self = @
    $(@el).each (index, el)->
      if el != context
        _self.setDeselected($(el))

  setDisplayState: (context)->
    if $(context).hasClass("select")
      @setDeselected(context)
    else
      @setSelected(context)

  setSelected: (context)->
    $(context).addClass('select')

  setDeselected: (context)->
    $(context).removeClass('select')