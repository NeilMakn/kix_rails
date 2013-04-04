# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Create namespace or use current namespace object
window.TaskApp = TaskApp || {};

$ ()->
  # This array is only for reference.

  $('.cat-button').click (e)->
    target = e.currentTarget
    subtask = $(this).parent().children('.subtasks')
    showDefaultPageContent()
    # Remove any select classes from subtask buttons.
    $('.subtask').trigger('deselect')

    if subtask.css('display') != 'block'
      $('.subtasks').trigger('hide_open_lists')
      $(this).addClass('select')
      $(this).children('.dotted').children('li').addClass('select')

      $(subtask).slideToggle 500, ()->
        if($(this).css('display') == 'none')
          $(target).removeClass('select')
          return true
      return true
    else
      $(subtask).slideToggle 500, ()->
        $(target).removeClass('select')
        $(target).children('.dotted').children('li').removeClass('select')
        return true

  $('.subtasks').on 'hide_open_lists', (e)->
    catButton = $(this).parent().children('.cat-button')
    if $(this).css('display') == 'block'
      $(catButton).removeClass('select')
      $(catButton).children('.dotted').children('li').removeClass('select')
      $(this).slideUp(500)
      return true
    return true

  # Subtask Code
  $('.subtask').on 'deselect', ->
    subBadge = $(this).children('.sub-badge')
    $(this).removeClass('select')
    $(".taskpage").hide()
    if $(subBadge).hasClass('select')
      $(subBadge).removeClass('select')
    return true

  $('.subtask').click ->
    category = $(this).parent().parent().attr("id")
    subtask = $(this).attr("id")

    hideDefaultPageContent()

    $('.subtask').trigger('deselect')
    $(this).addClass('select')
    subBadge = $(this).children('.sub-badge')

    if $(subBadge).hasClass('complete')
      $(subBadge).addClass('select')
      $("#toggle1-"+subtask).attr("checked", "checked")

    taskPageId = "#taskpage-" + subtask
    $(".taskpage").show()
    $(".taskpage-subtask").hide()
    $("#taskpage-"+subtask).show()
    return true

  # Form Setup

  setFormEvents = ->
      # toggleSetup is a call to a Flat UI setup function in
      # vendor/assets/javascripts/custom_radio.js
      TaskApp.toggleSetup()

      $(".toggle-task").change (e)->
        category = $(this).parent().data('cat')
        subtask = $(this).parent().data('subtask')
        state = parseInt($(this).val(), 10)
        setTaskComplete(subtask, state)
        # count the number of tasks in this category that are complete
        cat_tasks_complete = $("#" + category + " .subtask .complete").size()
        setSubProgressBar(category, cat_tasks_complete)
        #Can also use this to check tasks $('.task-cb:checked').size()
        total_tasks_complete = $(".subtask .complete").size()
        setMainProgressBar(total_tasks_complete)
        setToggleText(e.currentTarget, state)

        data = formatFormValues($(this).closest('form').serializeArray())
        sync(data)

  setToggleText = (target, toggleState)->
    if toggleState == 0
      toggleText = "Mark Complete"
    else
      toggleText = "Completed"
    target = $(target).parent().parent().children(".toggle-text")
    $(target).html(toggleText)

  # Page content display
  showDefaultPageContent = ->
    $("#main-content").removeClass("default-bg").addClass("mountain-bg")
    $("#taskpage-default").show()

  hideDefaultPageContent = ->
    $("#main-content").removeClass("mountain-bg").addClass("default-bg")
    $("#taskpage-default").hide()

  # Task progress / complete code
  setMainProgressBar = (completed_tasks)->
      if completed_tasks > 25
        completed_tasks = 25
        return true
      increment = 493/25
      bar_width = (increment * completed_tasks) + "px"
      $('#progress-bar-main').css('width', bar_width)
      return true

  setSubProgressBar = (category, completed_tasks)->
    # category = $(subtask).parent().parent().attr("id")
    pBar = '#' + category + ' .dotted li'
    $(pBar).removeClass 'complete'
    pBar = '#' + category + ' .dotted li:nth-child(-n' + completed_tasks + ')'
    $(pBar).addClass 'complete'
    return true

  setTaskComplete = (subtask, state) ->
    taskId = "#" + subtask
    badgeClass = ".sub-badge"
    if state == 1
      $(taskId + " " + badgeClass).removeClass('incomplete').addClass('complete')
    else
      $(taskId + " " + badgeClass).removeClass('complete').addClass('incomplete')

  createForms = ->
    source = $("#form-template").html()
    template = Handlebars.compile(source)
    $(".subtask").each (index, element)->
      category = $(this).parent().parent().attr("id")
      subtask = $(this).attr("id")
      data = { category: category, subtask: subtask}
      $("#taskpage-"+subtask).children(".form-display").html(template(data))
    # return true

  populateForms = (topic, data)->
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
        setSubProgressBar(category, cat_tasks_completed)
        setTaskComplete(subtask, 1)
        last_cat = category
    total_tasks_completed = $(".subtask .complete").size()
    setMainProgressBar(total_tasks_completed)

  refesh = (topic, data)->
    tView = new PreKix.TaskTextareaView()
    daysLeft = new PreKix.DaysLeftView(new Date("2013-04-27 11:23:00")).render()

  init = ->
    $('.subtasks').hide()
    $(".taskpage-subtask").hide()
    $(".taskpage").hide()

    $.pubsub("subscribe", "fetch_success", populateForms)
    $.pubsub("subscribe", "fetch_success", refesh)

    ajax_requester = new PreKix.AjaxRequester()
    ajax_requester.fetch()

    $.pubsub("subscribe", "user_input_update", (topic, data)-> ajax_requester.update(topic, data))

  init()