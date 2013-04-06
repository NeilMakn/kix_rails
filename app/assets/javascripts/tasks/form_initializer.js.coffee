@PreKix = PreKix ? {}
class PreKix.FormInitializer
  constructor: ->
    @setListenerEvents()

  setListenerEvents: ->
    $.pubsub("subscribe", "fetch_success", @onFetchSuccess.bind(this))

  onFetchSuccess: (message, data)->
    if message == "fetch_success"
      @populateForms(data)

  handleCompletedTasks: (category, subtask, completed)->
    if completed != null
      toggleData = {category: category, subtask: subtask}
      $.pubsub('publish', 'toggle_task_complete', toggleData)

  populateForms: (data)->
    _self = @
    # Do template
    source    = $("#form-template").html()
    template  = Handlebars.compile(source)
    $.each data, (index, value)->
      id        = value.id
      type      = value.type_task
      text      = value.text
      completed = value.completed
      subtask   = PreKix.TYPES[type]
      category  = subtask.split("-")[0]
      data      = { category: category, subtask: subtask, id: id, text: text, completed: completed }
      #
      context = $("#taskpage-" + subtask)
      $("#taskpage-" + subtask).children(".form-display").html(template(data))
      # handleCompletedTasks notifies the task tracker
      # if a task is complete so views can be updated
      _self.handleCompletedTasks(category, subtask, completed)

    $.pubsub("publish", "populate_forms_complete", data)

