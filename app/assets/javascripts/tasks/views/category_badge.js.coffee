class PreKix.CategoryBadge
  constructor: ->
    @el = '.category-badge'
    @context = null
    @setEventListeners()

  findContextByCategoryButton: (context)->
    $(context).children(@el).get(0)

  findContextByCategory: (context)->
    $('#' + context).find(@el)

  setEventListeners: ->
    $.pubsub("subscribe", "category_button_click", @onCategoryButtonClick.bind(this))
    $.pubsub("subscribe", "category_tasks_complete", @onCategoryTaskComplete.bind(this))
    $.pubsub("subscribe", "category_tasks_incomplete", @onCategoryTaskIncomplete.bind(this))

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
    unless $(context).hasClass('complete')
      $(context).removeClass('incomplete').addClass('incomplete-select')

  setIncomplete: (context)->
    unless $(context).hasClass('complete')
      $(context).removeClass('incomplete-select').addClass('incomplete')

  onCategoryButtonClick: (message, buttonData)->
    context = @findContextByCategoryButton(buttonData)
    @setDisplay(context)
    @deselectOthers(context)

  onCategoryTaskComplete: (message, category)->
    context = @findContextByCategory(category)
    unless $(context).hasClass('complete')
      $(context).removeClass('incomplete').addClass('complete')

  onCategoryTaskIncomplete: (message, category)->
    context = @findContextByCategory(category)
    if $(context).hasClass('complete')
      $(context).removeClass('complete').addClass('incomplete-select')
