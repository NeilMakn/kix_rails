var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.CategoryMenuList = Backbone.View.extend({
    el: "#sidenav",
    initialize: function(){
      this.setEventListeners();
      prekix.CategoryList.fetch();
    },

    setEventListeners: function(){
      _.bindAll(this, "addOne");
      this.listenTo(prekix.CategoryList, 'add', this.addOne);
    },

    addOne: function(model){
      var category = model.get('category');
      var el = '#' + category + '-menu';
      var categoryMenu = new prekix.views.CategoryMenu({el:el, model:model});
    }
  });
})(jQuery);