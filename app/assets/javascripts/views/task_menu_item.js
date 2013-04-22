var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskMenuItem = Backbone.View.extend({
    selected: false,

    initialize: function(options){
      this.category = options.category;
      this.task     = options.task;
      this.model    = options.model;
      this.selected = false;
      this.setEventListeners();
      this.addBadge();
    },

    setEventListeners: function(){
      _.bindAll(this, 'onTaskMenuItemSelect');
      prekix.PubSub.on('task_menu_item_select', this.onTaskMenuItemSelect);

      _.bindAll(this, 'onCategoryButtonDeselect');
      prekix.PubSub.on('category_button_deselect', this.onCategoryButtonDeselect);
    },

    events: {
      'click' : 'onClick'
    },

    addBadge: function(){
      var el = this.$el.find('.sub-badge').get(0);
      var options = {
        el:el,
        category: this.category,
        task: this.task,
        model: this.model
      };
      this.badge = new prekix.views.TaskBadge(options);
    },

    onClick: function(e){
      if (this.selected === false){
        this.select();
      }
      prekix.PubSub.trigger('task_menu_item_click', this.task);
    },

    onCategoryButtonDeselect: function(category){
      this.selected = false;
      if(this.category === category){
        this.deselect();
      }
    },

    onTaskMenuItemSelect: function(task){
      if(this.task !== task && this.selected === true){
        this.deselect();
      }
    },

    select: function(){
      this.selected = true;
      this.$el.addClass('select');
      prekix.PubSub.trigger('task_menu_item_select', this.task);
    },

    deselect: function(){
      this.selected = false;
      this.$el.removeClass('select');
      prekix.PubSub.trigger('task_menu_item_deselect', this.task);
    }
  });
})(jQuery);