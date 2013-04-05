@PreKix = PreKix ? {}
class PreKix.TaskPage
  constructor: ->
    @el = '.taskpage-subtask'
    @setEvents()

  findTaskPage: (context)->
    subtask = $(context).attr("id")
    $("#taskpage-"+subtask).get(0)

  setEvents: ->
    $.pubsub("subscribe", "category_button_click", @handleEvents.bind(this))
    $.pubsub("subscribe", "subtask_button_click", @handleEvents.bind(this))

  handleEvents: (message, context)->
    if message == "subtask_button_click"
      context = @findTaskPage(context)
      @hideAll()
      $(context).show()
    else if message == "category_button_click"
      $(@el).hide()

  hideAll: ->
    $(@el).hide()

  hideOthers: (context)->
    $(@el).each (index, el)->
      if el != context
        $(el).hide()
