var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.App = Backbone.View.extend({
    el: "#container",

    initialize: function(){
      this.launchDate = new prekix.views.LaunchDate();
      this.progressBar = new prekix.views.ProgressBarMain();
      this.categoryMenuList = new prekix.views.CategoryMenuList();
      this.mainContent = new prekix.views.MainContent();
      prekix.Tasks.fetch({
        success: function(){
          prekix.toggleSetup();
        }
      });
    }
  });
})(jQuery);