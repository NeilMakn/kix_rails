@PreKix = PreKix ? {}
class PreKix.AjaxRequester
  constructor: ->
    @setEvents()

  setEvents: ->
    $.pubsub('subscribe', 'user_input_update', @update.bind(this))

  formatFormValues: (formData)->
    data = formData.serializeArray()
    args = {}
    $.each data, (index, el)->
      args[el.name] = el.value
    return {task:args}

  update: (message, form)->
    data = @formatFormValues(form)
    @sync(data)

  sync: (data)->
    taskId = data.task.id
    url = "tasks/"+taskId
    $.ajax
      url: url
      type: "put"
      dataType: "json"
      data: data
      success: (data)->
        $.pubsub("publish", "sync_success", data)
        console.log("sync success!")
      error: (err, status, exception)->
        $.pubsub("publish", "sync_error", err)

  fetch: ->
    return $.ajax
      url: "tasks"
      dataType: "json"
      success: (data)->
        $.pubsub("publish", "fetch_success", data)
      error: (err, status, exception)->
        $.pubsub("publish", "fetch_error", err)