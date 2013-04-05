@PreKix = PreKix ? {}
class PreKix.ToggleText
  constructor: ->

  setToggleText: (target, toggleState)->
    if toggleState == 0
      toggleText = "Mark Complete"
    else
      toggleText = "Completed"
    target = $(target).parent().parent().children(".toggle-text")
    $(target).html(toggleText)