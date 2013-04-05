@PreKix = PreKix ? {}
class PreKix.FormInitializer
  constructor: ->
    @createForms()

  createForms: ->
    source = $("#form-template").html()
    template = Handlebars.compile(source)
    $(".subtask").each (index, element)->
      category = $(this).parent().parent().attr("id")
      subtask = $(this).attr("id")
      data = { category: category, subtask: subtask}
      $("#taskpage-"+subtask).children(".form-display").html(template(data))

  populateForms: (topic, data)->
    cat_tasks_completed = 0
    last_cat = ""
    $.each data, (index, value)->
      id        = value.id
      type      = value.type_task
      text      = value.text
      completed = value.completed
      subtask   = PreKix.TYPES[type]
      category  = subtask.split("-")[0]
      data      = { category: category, subtask: subtask, id: id, text: text, completed: completed }
      # Do template
      source    = $("#form-template").html()
      template  = Handlebars.compile(source)
      $("#taskpage-"+subtask).children(".form-display").html(template(data))
      # update progress bars
      if completed != null
        if category != last_cat then cat_tasks_completed = 0
        cat_tasks_completed +=1
        $.pubsub("publish", "subtask_update", {category: category, tasks_complete: cat_tasks_completed})
        setTaskComplete(subtask, 1)
        last_cat = category
    total_tasks_completed = $(".subtask .complete").size()
    $.pubsub("publish", "task_update", total_tasks_completed)
    return true