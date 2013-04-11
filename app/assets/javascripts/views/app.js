var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.App = Backbone.View.extend({
    el: "#container",

    initialize: function(){
      prekix.Sidebar = new prekix.views.Sidebar();
      prekix.MainContent = new prekix.views.MainContent();
      prekix.Tasks.fetch();
    }
  });
})(jQuery);