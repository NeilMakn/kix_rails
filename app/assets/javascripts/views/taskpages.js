var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskPages = Backbone.View.extend({
    el: '#taskpage-subtask',
    initialize: function(){
      this.setEventListeners();
      this.$el.hide();
    },

    setEventListeners: function(){
      _.bindAll(this, "addOne");
      this.listenTo(prekix.Tasks, 'add', this.addOne);
    },

    addOne: function(model){
      var subtask  = prekix.TYPES[model.get('type_task')];
      var category = subtask.split("-")[0];
      var el       = '#taskpage-' + subtask;
      var taskPage = new prekix.views.TaskPage({
        el:el,
        category:category,
        subtask:subtask,
        model:model
      });
    }
  });
})(jQuery);