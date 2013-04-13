var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskForm = Backbone.View.extend({
    initialize: function(options){
      this.model    = options.model;
      this.category = options.category;
      this.task  = options.task;
      this.render();
    },

    injectFormTemplate: function(){
      var formData      = this.model.attributes;
      formData.category = this.category;
      formData.task  = this.task;
      this.$el.html(prekix.handlebarsTaskForm(formData));
    },

    sendFormData: function(){

    },

    render: function(){
      this.injectFormTemplate();
      var options = {
        parent: this,
        category: this.category,
        task: this.task,
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