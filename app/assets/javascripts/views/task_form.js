var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskForm = Backbone.View.extend({
    initialize: function(options){
      this.model    = options.model;
      this.category = options.category;
      this.subtask  = options.subtask;
      // this.setEventListeners();
      this.render();
    },

    setEventListeners: function(){
      _.bindAll(this, 'onTaskToggleChange');
      prekix.PubSub.on('task_toggle_change', this.onTaskToggleChange);

      _.bindAll(this, 'onTaskTextareaChange');
      prekix.PubSub.on('task_textarea_change', this.onTaskTextareaChange);
    },

    injectFormTemplate: function(){
      var formData      = this.model.attributes;
      formData.category = this.category;
      formData.subtask  = this.subtask;
      this.$el.html(prekix.handlebarsTaskForm(formData));
    },

    sendFormData: function(){

    },

    render: function(){
      this.injectFormTemplate();
      var options = {
        parent: this,
        category: this.category,
        subtask: this.subtask,
        model: this.model
      };
      //
      options.el = this.$el.find('.toggle-task');
      this.taskToggle = new prekix.views.TaskToggle(options);
      //
      options.el = this.$el.find('textarea');
      this.taskTextarea = new prekix.views.TaskTextarea(options);
    }
  });
})(jQuery);