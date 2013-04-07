@PreKix = PreKix ? {}
class PreKix.SubtaskMenu
  constructor: ->
    @el = '.subtasks'
    @setEventListeners()
    @setEventHandlers()

  findSubtaskMenu: (catButton)->
    $(catButton).parent().children(@el).get(0)

  setEventListeners: ->
    $.pubsub("subscribe", "category_button_click", @onCategoryButtonClick.bind(this))

  setEventHandlers: ->
    _self = this
    $(@el).on "close_open_subtask_menus", ->
      _self.closeOpenMenus(this)

  isOpen: (context)->
    if $(context).css("display") == "block" then true else false

  isClosed: (context)->
    if $(context).css("display") == "none" then true else false

  showMenu: (context)->
    $(context).slideDown 500, ->
      $.pubsub("publish", "subtask_menu_open_complete", context)

  hideMenu: (context)->
    $(context).slideUp 500, ->
      $.pubsub("publish", "subtask_menu_close_complete", context)

  displayMenu: (context)->
    if @isClosed(context)
      @showMenu(context)
    else
      @hideMenu(context)

  closeOpenMenus: (context)->
    if $(context).css('display') == 'block'
      $(context).slideUp(500)

  onCategoryButtonClick: (message, context)->
    context = @findSubtaskMenu(context)
    $(@el).trigger "close_open_subtask_menus"
    @displayMenu(context)
