var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskPage = Backbone.View.extend({
    initialize: function(options){
      this.model    = options.model;
      this.category = options.category;
      this.task     = options.task;
      this.setEventListeners();
      this.render();
    },

    setEventListeners: function(){
      _.bindAll(this, 'onTaskMenuItemClick');
      prekix.PubSub.on('task_menu_item_click', this.onTaskMenuItemClick);
    },

    onTaskMenuItemClick: function(task){
      if(this.task !== task){
        this.$el.hide();
      }else{
        this.$el.show();
      }
    },

    render: function(){
      var el = this.$el.find('.form-display').get(0);
      var options = {
        el:el,
        category: this.category,
        task: this.task,
        model: this.model
      };
      this.taskForm = new prekix.views.TaskForm(options);
      this.$el.hide();
    }
  });
})(jQuery);