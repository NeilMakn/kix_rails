var prekix = prekix || {};
prekix.views = prekix.views || {};

prekix.views.Sidebar = Backbone.View.extend({
  el: "#sidenav",
  initialize: function(options){
    this.listenTo(prekix.Todos, 'add', addOne);
  },

  addOne: function(){
    console.log("addOne");
  }
});