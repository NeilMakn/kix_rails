@PreKix = PreKix ? {}
class PreKix.TaskTextareaView
  constructor: (@waitTime=1500)->
    @el = 'textarea'
    @inputTimer = null
    @setKeyUp()

  createInputTimer: (target)->
    if(inputTimer)
      clearTimeout(@inputTimer)

    inputTimer = setTimeout ()->
      form = $(target).closest('form')
      $.pubsub("publish", "user_input_update", form)
    ,@waitTime

  setKeyUp: ->
    _self = @
    $(@el).keyup (e)->
      _self.createInputTimer(e.currentTarget)
