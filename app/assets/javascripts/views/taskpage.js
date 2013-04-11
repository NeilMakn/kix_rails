var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskPage = Backbone.View.extend({
    initialize: function(options){
      this.model    = options.model;
      this.category = options.category;
      this.subtask  = options.subtask;
      this.$el.hide();
      this.initForm();
      this.setEventListeners();
    },

    initForm: function(){
      var formData      = this.model.attributes;
      formData.category = this.category;
      formData.subtask  = this.subtask;
      var context       = $("#taskpage-" + this.subtask).get(0);
      $(context).find('.form-display').html(prekix.handlebarsTaskForm(formData));
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
    }
  });
})(jQuery);