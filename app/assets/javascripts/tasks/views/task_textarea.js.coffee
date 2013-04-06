@PreKix = PreKix ? {}
class PreKix.TaskTextarea
  constructor: (@waitTime=1500)->
    @el = 'textarea'
    @setEventHandlers()
    @inputTimer = null

  createInputTimer: (target)->
    _self = @
    if(@inputTimer)
      clearTimeout(@inputTimer)
    @inputTimer = setTimeout ()->
      form = $(target).closest('form')
      _self.publishUserInputUpdate(form)
    ,@waitTime

  setEventHandlers: ->
    _self = @
    $(@el).keyup (e)->
      _self.createInputTimer(e.currentTarget)

  publishUserInputUpdate: (form)->
      $.pubsub("publish", "user_input_update", form)
