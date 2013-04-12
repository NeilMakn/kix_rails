# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Create namespace or use current namespace object
window.PreKix = PreKix || {};

$ ()->
  onPopulateFormsComplete = (topic, data)->
    daysLeft = new PreKix.DaysLeft(new Date("2013-04-27 11:23:00")).render()
    taskTextarea = new PreKix.TaskTextarea()
    taskToggle = new PreKix.TaskToggle()
    PreKix.toggleSetup()
    autoSave = new PreKix.Autosave()

  init = ->
    $('.subtasks').hide()
    $(".taskpage-subtask").hide()

    progressBarWidthMax = 493
    progressBarTaskTotal = 25

    formInitializer = new PreKix.FormInitializer()
    progressBar = new PreKix.ProgressBar(progressBarWidthMax, progressBarTaskTotal)
    subtaskProgressBar = new PreKix.SubtaskProgressBar()
    categoryButton = new PreKix.CategoryButton()
    categoryBadge = new PreKix.CategoryBadge()
    subtasksMenu = new PreKix.SubtaskMenu()
    subtaskButton = new PreKix.SubtaskButton()
    subtaskBadge = new PreKix.SubtaskBadge()
    defaultPage = new PreKix.DefaultPage()
    taskPage = new PreKix.TaskPage()
    taskTracker = new PreKix.TaskTracker()
    taskToggleText = new PreKix.ToggleText()

    ajax_requester = new PreKix.AjaxRequester()
    ajax_requester.fetch()

    $.pubsub("subscribe", "populate_forms_complete", onPopulateFormsComplete.bind(this))
  init()