@PreKix = PreKix ? {}
class PreKix.SubtaskBadge
  constructor: ->
    @el = '.sub-badge'
    @setEventsListeners()

  setEventsListeners: ->
    $.pubsub("subscribe", "category_button_click", @onCategoryButtonClick.bind(this))
    $.pubsub("subscribe", "subtask_button_click", @onSubtaskButtonClick.bind(this))
    $.pubsub("subscribe", "toggle_task_complete", @onToggleTaskComplete.bind(this))
    $.pubsub("subscribe", "toggle_task_incomplete", @onToggleTaskIncomplete.bind(this))

  getContextBySubtaskButton: (subtaskButton)->
    $(subtaskButton).find(@el).get(0)

  getContextBySubtask: (subtask)->
    $('.subtasks #'+ subtask + ' .sub-badge').get(0)

  clearAllSelects: ->
    $(@el).removeClass('select')

  # Event Handlers
  onCategoryButtonClick: (message, context)->
    @clearAllSelects()

  onSubtaskButtonClick: (message, context)->
    context = @getContextBySubtaskButton(context)
    @clearAllSelects()
    $(context).addClass('select')

  onToggleTaskComplete: (message, toggleData)->
    context = @getContextBySubtask(toggleData.subtask)
    $(context).removeClass('incomplete').addClass('complete')

  onToggleTaskIncomplete: (message, toggleData)->
    context = @getContextBySubtask(toggleData.subtask)
    $(context).removeClass('complete').addClass('incomplete')
