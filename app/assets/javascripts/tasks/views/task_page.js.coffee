@PreKix = PreKix ? {}
class PreKix.TaskPage
  constructor: ->
    @el = '.taskpage-subtask'
    @setEventListeners()

  findTaskPage: (context)->
    subtask = $(context).attr("id")
    $("#taskpage-"+subtask).get(0)

  setEventListeners: ->
    $.pubsub("subscribe", "category_button_click", @onCategoryButtonClick.bind(this))
    $.pubsub("subscribe", "subtask_button_click", @onSubtaskButtonClick.bind(this))

  onCategoryButtonClick: (message, context)->
    $(@el).hide()

  onSubtaskButtonClick: (message, context)->
    context = @findTaskPage(context)
    @hideAll()
    $(context).show()

  hideAll: ->
    $(@el).hide()

  hideOthers: (context)->
    $(@el).each (index, el)->
      if el != context
        $(el).hide()
