@PreKix = PreKix ? {}
class PreKix.ProgressBar
  constructor: (bar_max_width, task_total)->
    @el = '#progress-bar-main'
    @bar_increment = bar_max_width/task_total

  getBarWidth: ->
    (@bar_increment * @completed_tasks) + "px"

  setComplete: (message, tasks_complete)->
    @completed_tasks = tasks_complete
    @render()

  increment: ->
    @completed_tasks += 1
    @render()

  deincrement: ->
    @completed_tasks -= 1
    @render()

  render: ->
    $(@el).css('width', @getBarWidth())