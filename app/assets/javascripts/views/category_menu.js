var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.CategoryMenu = Backbone.View.extend({
    initialize: function(options){
      this.model = options.model;
      this.addCategoryButton();
      this.addSubtaskMenu();
    },

    addCategoryButton: function(){
      var category = this.model.get('category');
      var el = this.$el.find('.cat-button').get(0);
      var options = {el: el, category: category};
      this.catBtn = new prekix.views.CategoryButton(options);
    },

    addSubtaskMenu: function(){
      var category = this.model.get('category');
      var el = this.$el.find('.subtasks').get(0);
      var options = {el: el, category: category};
      this.subtaskMenu = new prekix.views.SubtaskMenu(options);
    }
  });
})(jQuery);