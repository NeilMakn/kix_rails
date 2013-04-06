@PreKix = PreKix ? {}
class PreKix.SubtaskProgressBar
  constructor: ->
    @el = '.dotted'
    @setEventListeners()

  getContext:(category)->
    context = "#" + category + " .cat-button"
    $(context).children('.dotted').get(0)

  setEventListeners: ->
    $.pubsub('subscribe', 'category_task_complete', @onCategoryTaskComplete.bind(this))

  onCategoryTaskComplete: (message, taskData)->
    console.log message
    category = taskData.category
    context = @getContext(category)
    completed = taskData.completed
    @render(context, completed)

  removeAll: (context)->
    context = $(context).children('li')
    $(context).removeClass('complete')

  fillCompleted: (context, completed)->
    dotList = 'li:nth-child(-n' + completed + ')'
    context = $(context).children(dotList)
    $(context).addClass('complete')

  render: (context, completed)->
    @removeAll(context)
    @fillCompleted(context, completed)