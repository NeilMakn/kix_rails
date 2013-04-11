var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.Sidebar = Backbone.View.extend({
    el: "#sidenav",

    initialize: function(){
      this.categories = prekix.CATEGORIES;
      this.subtasks = prekix.TYPES;
      this.addSideBarElements();
    },

    addSideBarElements: function(){
      var _self = this;
      var last_category = null;
      $.each(this.subtasks, function(index, subtask){
        var category = subtask.split('-')[0];
        if(category !== last_category){
          _self.addCategoryButton(category);
          _self.addSubtaskMenu(category);
          last_category = category;
        }
        _self.addSubtask(category, subtask);
      });
    },

    addSubtaskMenu: function(category){
      var el = $('#' + category).find('.subtasks').get(0);
      var menuData = {el: el, category: category};
      var cat = new prekix.views.SubtaskMenu(menuData);
    },

    addCategoryButton: function(category){
      var el = $('#' + category).find('.cat-button').get(0);
      var buttonData = {el: el, category: category};
      var cat = new prekix.views.CategoryButton(buttonData);
    },

    addSubtask: function(category, subtask){
      var el = '#' + subtask;
      var subtaskData = {el: el, category: category, subtask: subtask};
      var subtaskMI = new prekix.views.SubtaskMenuItem(subtaskData);
    }
  });
})(jQuery);