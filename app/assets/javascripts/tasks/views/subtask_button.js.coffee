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

        # $(target).children('.dotted').children('li').removeClass('select')