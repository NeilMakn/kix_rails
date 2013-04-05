@PreKix = PreKix ? {}
class PreKix.SubtaskBadge
  constructor: ->
    @el = '.sub-badge'

  setComplete: (message, subtask)->
    @subtask = subtask
    @render()

  render: ->
    taskId = "#" + @subtask
    if state == 1
      $(taskId + " " + @el).removeClass('incomplete').addClass('complete')
    else
      $(taskId + " " + @el).removeClass('complete').addClass('incomplete')

