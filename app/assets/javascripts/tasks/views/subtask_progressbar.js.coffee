@PreKix = PreKix ? {}
class PreKix.SubtaskProgressBar
  constructor: ->
    @el = '.dotted'
    @setEvents()

  getContext:(category)->
    context = "#" + category + " .cat-button"
    $(context).children('.dotted')

  setEvents: ->
    $.pubsub('subscribe', 'update_category_task_complete', @setComplete.bind(this))

  setComplete: (message, taskData)->
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