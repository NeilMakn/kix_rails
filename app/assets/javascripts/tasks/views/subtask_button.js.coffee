@PreKix = PreKix ? {}
class PreKix.SubtaskButton
  constructor: ->
    @el = '.subtask'
    @setEventListeners()
    @setEventHandlers()

  setEventListeners: ->
    $.pubsub("subscribe", "subtask_button_click", @onSubtaskButtonClick.bind(this))
    $.pubsub("subscribe", "category_button_click", @onCategoryButtonClick.bind(this))

  setEventHandlers: ->
    $(@el).click (e)->
      context = e.currentTarget
      $.pubsub("publish", "subtask_button_click", context)

  onCategoryButtonClick: (message, context)->
    @setDeselected(@el)

  onSubtaskButtonClick: (message, context)->
    @deselectOthers(context)
    @setDisplayState(context)

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