@PreKix = PreKix ? {}
class PreKix.SubtaskBadge
  constructor: ->
    @el = '.toggle-task'

  setEvents: ->
    $(@el).change (e)->
      target = e.currentTarget
      $(target).closest('form')
      $.pubsub("publish", "user_input_update", form)

      state = parseInt($(target).val(), 10)
      $.pubsub("publish", "task_toggle_update", {subtask:subtask,  state:state})

      category = $(this).parent().data('cat')
      subtask = $(this).parent().data('subtask')

      setTaskComplete(subtask, state)
      # count the number of tasks in this category that are complete
      cat_tasks_complete = $("#" + category + " .subtask .complete").size()
      subtaskProgressBar.setComplete(category, cat_tasks_complete)

      #Can also use this to check tasks $('.task-cb:checked').size()
      total_tasks_complete = $(".subtask .complete").size()
      progressBar.setComplete(total_tasks_complete)
      setToggleText(e.currentTarget, state)

      # data = formatFormValues($(this).closest('form').serializeArray())
      # sync(data)


  setComplete: (message, subtask)->
    @subtask = subtask
    @render()

  render: ->


