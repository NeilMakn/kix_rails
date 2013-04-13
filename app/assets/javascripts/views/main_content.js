var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){

  prekix.views.MainContent = Backbone.View.extend({
    el: '#main-content',
    initialize: function(){
      this.taskPages = new prekix.views.TaskPages();
      this.setEventListeners();
    },

    setEventListeners: function(){
      _.bindAll(this, 'onCategoryButtonClick');
      prekix.PubSub.on('category_button_click', this.onCategoryButtonClick);
      _.bindAll(this, 'onTaskMenuItemClick');
      prekix.PubSub.on('task_menu_item_click', this.onTaskMenuItemClick);
    },

    onCategoryButtonClick: function(category){
      this.$el.find('#taskpage-default').show();
      this.$el.find('#taskpage-task').hide();
    },

    onTaskMenuItemClick: function(){
      this.$el.find('#taskpage-task').show();
      this.$el.find('#taskpage-default').hide();
    }
  });

})(jQuery);