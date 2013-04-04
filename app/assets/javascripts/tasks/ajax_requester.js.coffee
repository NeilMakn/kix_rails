@PreKix = PreKix ? {}
class PreKix.AjaxRequester

  formatFormValues: (formData)->
    console.log formData
    data = formData.serializeArray()
    args = {}
    $.each data, (index, el)->
      args[el.name] = el.value
    console.log args
    return {task:args}

  update: (message, form)->
    data = @formatFormValues(form)
    console.log data
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
      error: (err, status, exception)->
        $.pubsub("publish", "sync_error", err)

  fetch: ->
    return $.ajax
      url: "tasks"
      dataType: "json"
      success: (data)->
        $.pubsub("publish", "fetch_success", data)
      error: (err, status, exception)->
        console.log err
        $.pubsub("publish", "fetch_error", err)