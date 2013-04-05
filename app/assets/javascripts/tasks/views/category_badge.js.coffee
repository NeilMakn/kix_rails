class PreKix.CategoryBadge
  constructor: ->
    @el = '.category-badge'
    @context = null
    @setEvents()

  findCategoryBadge: (context)->
    $(context).children(@el).get(0)

  setEvents: ->
    $.pubsub("subscribe", "category_button_click", @handleEvents.bind(this))
    $.pubsub("subscribe", "subtasks_complete", @handleEvents.bind(this))

  handleEvents: (message, context)->
    badge = @findCategoryBadge(context)
    @setDisplay(badge)
    @deselectOthers(badge)

  setDisplay: (context)->
    if $(context).hasClass('incomplete')
      @setIncompleteSelected(context)
    else
      @setIncomplete(context)

  deselectOthers: (context)->
    _self = @
    $(@el).each (index, el)->
      if el != context
        _self.setIncomplete($(el))

  setIncompleteSelected: (context)->
    $(context).removeClass('incomplete').addClass('incomplete-select')

  setIncomplete: (context)->
    $(context).removeClass('incomplete-select').addClass('incomplete')

  setComplete: (context)->
    $(context).removeClass('incomplete').addClass('incomplete-select')