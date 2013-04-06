@PreKix = PreKix ? {}
class PreKix.ProgressBar
  constructor: (bar_max_width, task_total)->
    @el = '#progress-bar-main'
    @bar_increment = bar_max_width/task_total
    @tasks_complete = 0
    @setEventListeners()

  setEventListeners: ->
    $.pubsub('subscribe', 'total_task_complete', @setComplete.bind(this))

  getBarWidth: ->
    (@bar_increment * @completed_tasks) + "px"

  setComplete: (message, tasks_complete)->
    @completed_tasks = tasks_complete
    @render()

  render: ->
    $(@el).css('width', @getBarWidth())