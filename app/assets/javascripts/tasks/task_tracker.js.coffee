
class PreKix.TaskTracker
  constructor: ->
    @setEventListeners()
    @totalTasksComplete = 0
    @categoryTaskMax = 5
    @tasksComplete = {story:0, fin:0, marketing:0, net:0, video:0}

  setEventListeners: ->
    $.pubsub('subscribe', 'toggle_task_complete', @onToggleTaskComplete.bind(this))
    $.pubsub('subscribe', 'toggle_task_incomplete', @onToggleTaskIncomplete.bind(this))

  incrementTask: (category)->
    @tasksComplete[category] += 1
    @totalTasksComplete += 1
    @publishCategoryTaskChange(category, @tasksComplete[category])
    @publishTotalTaskChange()
    if @tasksComplete[category] == @categoryTaskMax
      @publishCategoryTasksComplete(category)

  deincrementTask: (category)->
    @tasksComplete[category] -= 1
    @totalTasksComplete -= 1
    @publishCategoryTaskChange(category, @tasksComplete[category])
    @publishTotalTaskChange()
    if @tasksComplete[category] < @categoryTaskMax
      @publishCategoryTasksIncomplete(category)

  onToggleTaskComplete: (message, toggleData)->
    @incrementTask(toggleData.category)

  onToggleTaskIncomplete: (message, toggleData)->
    @deincrementTask(toggleData.category)

  #
  publishCategoryTasksComplete: (category)->
    $.pubsub('publish', 'category_tasks_complete', category)

  publishCategoryTasksIncomplete: (category)->
    $.pubsub('publish', 'category_tasks_incomplete', category)

  publishCategoryTaskChange: (category, completed)->
    taskData = {category: category, completed: completed}
    $.pubsub('publish', 'category_task_complete', taskData)

  publishTotalTaskChange:->
    $.pubsub('publish', 'total_task_complete', @totalTasksComplete)




