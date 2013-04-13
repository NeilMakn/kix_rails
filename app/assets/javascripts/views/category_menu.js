var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.CategoryMenu = Backbone.View.extend({
    initialize: function(options){
      this.model = options.model;
      this.addCategoryButton();
      this.addTaskMenu();
    },

    addCategoryButton: function(){
      var category = this.model.get('category');
      var el = this.$el.find('.cat-button').get(0);
      var options = {el: el, category: category};
      this.catBtn = new prekix.views.CategoryButton(options);
    },

    addTaskMenu: function(){
      var category = this.model.get('category');
      var el = this.$el.find('.tasks').get(0);
      var options = {el: el, category: category};
      this.taskMenu = new prekix.views.TaskMenu(options);
    }
  });
})(jQuery);