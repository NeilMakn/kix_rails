# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Create namespace or use current namespace object
window.TaskApp = TaskApp || {};

$ ()->
  # This array is only for reference.

  # Form Setup

  setFormEvents = ->
    # toggleSetup is a call to a Flat UI setup function in
    # vendor/assets/javascripts/custom_radio.js
    TaskApp.toggleSetup()

  # Page content display
  showDefaultPageContent = ->
    $("#main-content").removeClass("default-bg").addClass("mountain-bg")
    $("#taskpage-default").show()

  hideDefaultPageContent = ->
    $("#main-content").removeClass("mountain-bg").addClass("default-bg")
    $("#taskpage-default").hide()

  # Task progress / complete code

  refesh = (topic, data)->
    tView = new PreKix.TaskTextareaView()
    daysLeft = new PreKix.DaysLeftView(new Date("2013-04-27 11:23:00")).render()

  init = ->
    barWidthMax = 493
    taskTotal = 25
    # progressBar = new PreKix.ProgressBar(barWidthMax, taskTotal)
    # subtaskProgressBar = new PreKix.SubtaskProgressBar()
    categoryButton = new PreKix.CategoryButton()
    subtasksMenu = new PreKix.SubtaskMenu()

    $('.subtasks').hide()
    $(".taskpage-subtask").hide()
    $(".taskpage").hide()

    # $.pubsub("subscribe", 'task_update', progressBar.setComplete.bind(progressBar))
    # $.pubsub("subscribe", 'task_update', subtaskProgressBar.setComplete.bind(subtaskProgressBar))

    # $.pubsub("subscribe", "fetch_success", populateForms)
    # $.pubsub("subscribe", "fetch_success", refesh)

    # ajax_requester = new PreKix.AjaxRequester()
    # ajax_requester.fetch()

    # $.pubsub("subscribe", "user_input_update", ajax_requester.update.bind(ajax_requester))

  init()