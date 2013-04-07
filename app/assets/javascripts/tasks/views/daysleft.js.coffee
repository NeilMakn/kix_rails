@PreKix = PreKix ? {}
class PreKix.DaysLeft
  constructor: (@launchDate, @suffix=" days left")->
    @el = '#flag'
    @nowDate  = new Date()

  findDaysLeft: ->
    Math.ceil((@launchDate - @nowDate) / 1000 / 60 / 60 / 24)

  render: ->
    @daysLeft = @findDaysLeft()
    $(@el).html @daysLeft + @suffix
