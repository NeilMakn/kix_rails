var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskPages = Backbone.View.extend({
    el: '#taskpage-task',
    initialize: function(){
      this.setEventListeners();
      this.$el.hide();
    },

    setEventListeners: function(){
      _.bindAll(this, "addOne");
      this.listenTo(prekix.Tasks, 'add', this.addOne);
    },

    addOne: function(model){
      var task  = prekix.TYPES[model.get('type_task')];
      var category = task.split("-")[0];
      var el       = '#taskpage-' + task;
      var taskPage = new prekix.views.TaskPage({
        el:el,
        category:category,
        task:task,
        model:model
      });
    }
  });
})(jQuery);