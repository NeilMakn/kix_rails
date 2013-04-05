@PreKix = PreKix ? {}
class PreKix.SubtaskProgressBar
  constructor: ->

  setComplete: (message, data)->
    # @completed_tasks = data.tasks_complete
    # @render(data.category, data.tasks_complete)

  increment: ->
    # @completed_tasks += 1
    # @render()

  deincrement: ->
    # @completed_tasks -= 1
    # @render()

  render: (category, tasks_complete)->
    # pBar = '#' + category + ' .dotted li'
    # $(pBar).removeClass 'complete'
    # pBar = '#' + category + ' .dotted li:nth-child(-n' + tasks_complete + ')'
    # $(pBar).addClass 'complete'