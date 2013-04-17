@PreKix = PreKix ? {}
class PreKix.Autosave
  constructor: ->
    @el = 'textarea'
    @setListenerEvents()
    @setEventHandlers()

  setListenerEvents: ->
    $.pubsub("subscribe", "sync_success", @saveContent.bind(this))
    $.pubsub("subscribe", "saving_now", @onTypingSaving.bind(this))

  saveContent: (message, data)->
    $(".autosave").html("All changes saved!")

  onTypingSaving: (message, context)->
    $(".autosave").html("")
    $(".autosave").html("Saving...")

  setEventHandlers: ->
    console.log($(@el))
    $(@el).keydown (e)->
      console.log("keydown happened")
      $.pubsub("publish", "saving_now")