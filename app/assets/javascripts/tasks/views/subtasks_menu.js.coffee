@PreKix = PreKix ? {}
class PreKix.SubtaskMenu
  constructor: ->
    @el = '.subtasks'
    @context = null
    @setEvents()

  setContext: (context)->
    @context = context

  findSubtasksByCategoryButton: (catButton)->
    $(catButton).parent().children(@el)

  isOpen: ->
    if $(@context).css("display") == "block" then true else false

  isClosed: ->
    if $(@context).css("display") == "none" then true else false

  setEvents: ->
    _self = this
    $(@el).on "close_open_subtask_menus", ->
      _self.closeOpenMenus(this)

    $.pubsub("subscribe", "category_button_click", @handleEvents.bind(this))

  handleEvents: (message, context)->
    context = @findSubtasksByCategoryButton(context)
    @setContext(context)
    $(@el).trigger "close_open_subtask_menus"
    @displayMenu()

  showMenu: ->
    $(@context).slideDown 500, ->
      $.pubsub("publish", "subtask_menu_open_complete", @context)

  hideMenu: ->
    $(@context).slideUp 500, ->
      $.pubsub("publish", "subtask_menu_close_complete", @context)

  displayMenu: ->
    if @isClosed()
      @showMenu()
    else
      @hideMenu()

  closeOpenMenus: (context)->
    if $(context).css('display') == 'block'
      $(context).slideUp(500)
      # $(catButton).removeClass('select')
      # $(catButton).children('.dotted').children('li').removeClass('select')

