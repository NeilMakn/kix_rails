var prekix = prekix || {};
prekix.views = prekix.views || {};

prekix.views.App = Backbone.View.extend({
  el: "#container",
  initialize: function(options){
    prekix.Sidebar = new prekix.views.Sidebar();
  }
});