@PreKix = PreKix ? {}
class PreKix.TaskToggle
  constructor: ->
    @el = '.toggle-task'
    @setEventHandlers()

  setEventHandlers: ->
    _self = @
    $(@el).change (e)->
      context = e.currentTarget
      _self.publishInputUpdate(context)
      _self.publishToggleUpdate(context)

  publishInputUpdate: (context)->
      formData =  $(context).closest('form')
      $.pubsub("publish", "user_input_update", formData)

  publishToggleUpdate: (context)->
      toggleState = parseInt($(context).val(), 10)
      toggleData = @formatToggleData(context)
      if toggleState == 1
        $.pubsub("publish", "toggle_task_complete", toggleData)

      else if toggleState == 0
        $.pubsub("publish", "toggle_task_incomplete", toggleData)

  formatToggleData: (context)->
    category = $(context).parent().data('cat')
    subtask = $(context).parent().data('subtask')
    data = {category: category, subtask: subtask}


