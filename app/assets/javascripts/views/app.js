var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.App = Backbone.View.extend({
    el: "#container",

    initialize: function(){
      this.launchDateDisplay = new prekix.views.LaunchDateDisplay({ model: prekix.ProjectModel });
      this.launchDateInput   = new prekix.views.LaunchDateInput({ model: prekix.ProjectModel });

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