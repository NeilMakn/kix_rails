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
      _.bindAll(this, 'onSubtaskMenuItemClick');
      prekix.PubSub.on('subtask_menu_item_click', this.onSubtaskMenuItemClick);
    },

    onCategoryButtonClick: function(category){
      this.$el.find('#taskpage-default').show();
      this.$el.find('#taskpage-subtask').hide();
    },

    onSubtaskMenuItemClick: function(){
      this.$el.find('#taskpage-subtask').show();
      this.$el.find('#taskpage-default').hide();
    }
  });

})(jQuery);