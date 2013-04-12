var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskPage = Backbone.View.extend({
    initialize: function(options){
      this.model    = options.model;
      this.category = options.category;
      this.subtask  = options.subtask;
      this.setEventListeners();
      this.render(options);
    },

    setEventListeners: function(){
      _.bindAll(this, 'onSubtaskMenuItemClick');
      prekix.PubSub.on('subtask_menu_item_click', this.onSubtaskMenuItemClick);
    },

    onSubtaskMenuItemClick: function(subtask){
      if(this.subtask !== subtask){
        this.$el.hide();
      }else{
        this.$el.show();
      }
    },

    render: function(data){
      var el = this.$el.find('.form-display').get(0);
      var options = {
        el:el,
        category: this.category,
        subtask: this.subtask,
        model: this.model
      };
      this.taskForm = new prekix.views.TaskForm(options);
      this.$el.hide();
    }
  });
})(jQuery);