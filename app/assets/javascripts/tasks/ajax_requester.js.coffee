@PreKix = PreKix ? {}
class PreKix.AjaxRequester
  contructor: ->

  sync: (data)->
    taskId = data.task.id
    url = "tasks/"+taskId
    $.ajax
      url: url
      type: "put"
      dataType: "json"
      data: data
      success: (data)->
      error: (err, status, exception)->

  fetch:  ->
    return $.ajax
      url: "tasks"
      dataType: "json"
      success: (data)->
        # populateForms(data)
        # setFormEvents()
      error: (err)->
        console.log err