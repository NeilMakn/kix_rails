@PreKix = PreKix ? {}
class PreKix.ToggleText
  constructor: ->
    @el = '.toggle-text'
    @setEvents()

  getContext: (subtask)->
    taskPageId = '#taskpage-' + subtask
    $(taskPageId).find(@el).get(0)

  setEvents: ->
    $.pubsub('subscribe', 'toggle_task_complete', @onToggleTaskComplete.bind(this))
    $.pubsub('subscribe', 'toggle_task_incomplete', @onToggleTaskIncomplete.bind(this))

  onToggleTaskComplete: (message, toggleData)->
    context = @getContext(toggleData.subtask)
    $(context).html('Task Completed')

  onToggleTaskIncomplete: (message, toggleData)->
    context = @getContext(toggleData.subtask)
    $(context).html('Mark Complete')