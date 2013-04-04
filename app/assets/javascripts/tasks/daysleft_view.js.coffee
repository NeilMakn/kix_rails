@PreKix = PreKix ? {}
class PreKix.DaysLeftView
  constructor: (@launchDate, @suffix=" days left")->
    @el = '#flag'
    @nowDate  = new Date()

  setLaunchDate: (@launchDate)->

  findDaysLeft: ->
    Math.ceil((@launchDate - @nowDate) / 1000 / 60 / 60 / 24)

  render: ->
    @daysLeft = @findDaysLeft()
    $(@el).html @daysLeft + @suffix
