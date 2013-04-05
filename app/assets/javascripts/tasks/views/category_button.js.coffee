@PreKix = PreKix ? {}
class PreKix.CategoryButton
  constructor: ->
    @el = '.cat-button'
    @context = null
    @setEvents()

  setContext: (context)->
    @context = context

  findCategory: ->
    $(@context).parent().attr("id")

  setEvents: ->
    $.pubsub("subscribe", "category_button_click", @handleEvents.bind(this))

    $(@el).click (e)->
      context = e.currentTarget
      $.pubsub("publish", "category_button_click", context)

  handleEvents: (message, context)->
    @setContext(context)
    @selectDisplayState()

  selectDisplayState: ()->
    if $(@context).hasClass("select")
      @setStateDeselected()
    else
      @setStateSelected()

  setStateSelected: ()->
    $(@context).addClass('select')
    $(@context).children('.dotted').children('li').addClass('select')

  setStateDeselected: ()->
    $(@context).removeClass('select')
    $(@context).children('.dotted').children('li').removeClass('select')