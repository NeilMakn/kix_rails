@PreKix = PreKix ? {}
class PreKix.SubtaskProgressBar
  constructor: ->
    @el = '.dotted'
    @setEventListeners()

  getContextByCategory:(category)->
    context = "#" + category + " .cat-button"
    $(context).children('.dotted').get(0)

  setEventListeners: ->
    $.pubsub('subscribe', 'category_task_complete', @onCategoryTaskComplete.bind(this))

  onCategoryTaskComplete: (message, taskData)->
    category = taskData.category
    context = @getContextByCategory(category)
    completed = taskData.completed
    @removeAll(context)
    @fillCompleted(context, completed)

  removeAll: (context)->
    context = $(context).children('li')
    $(context).removeClass('complete')

  fillCompleted: (context, completed)->
    dotList = 'li:nth-child(-n' + completed + ')'
    context = $(context).children(dotList)
    $(context).addClass('complete')