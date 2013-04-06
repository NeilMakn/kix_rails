@PreKix = PreKix ? {}
class PreKix.CategoryButton
  constructor: ->
    @el = '.cat-button'
    @setEventListeners()
    @setEventHandlers()

  setEventListeners: ->
    $.pubsub("subscribe", "category_button_click", @onCategoryButtonClick.bind(this))

  setEventHandlers: ->
    $(@el).click (e)->
      context = e.currentTarget
      $.pubsub("publish", "category_button_click", context)

  onCategoryButtonClick: (message, context)->
    @deselectOthers(context)
    @setDisplayState(context)

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
    $(context).children('.dotted').children('li').addClass('select')

  setDeselected: (context)->
    $(context).removeClass('select')
    $(context).children('.dotted').children('li').removeClass('select')