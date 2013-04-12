var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.App = Backbone.View.extend({
    el: "#container",

    initialize: function(){
      this.categoryMenuList = new prekix.views.CategoryMenuList();
      // this.mainContent = new prekix.views.MainContent();
      prekix.Tasks.fetch();
    }
  });
})(jQuery);