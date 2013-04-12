var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.SubtaskMenuItem = Backbone.View.extend({
    selected: false,

    initialize: function(options){
      this.category = options.category;
      this.subtask  = options.subtask;
      this.model    = options.model;
      this.setEventListeners();
      this.addBadge();
    },

    setEventListeners: function(){
      _.bindAll(this, 'onSubtaskMenuItemSelect');
      prekix.PubSub.on('subtask_menu_item_select', this.onSubtaskMenuItemSelect);

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
        subtask: this.subtask,
        model: this.model
      };
      this.badge = new prekix.views.TaskBadge(options);
    },

    onClick: function(e){
      if (this.selected === false){
        this.select();
      }else{
        this.deselect();
      }
      prekix.PubSub.trigger('subtask_menu_item_click', this.subtask);
    },

    onCategoryButtonDeselect: function(category){
      if(this.category === category){
        this.deselect();
      }
    },

    onSubtaskMenuItemSelect: function(subtask){
      if(this.subtask !== subtask && this.selected === true){
        this.deselect();
      }
    },

    select: function(){
      this.selected = true;
      this.$el.addClass('select');
      prekix.PubSub.trigger('subtask_menu_item_select', this.subtask);
    },

    deselect: function(){
      this.selected = false;
      this.$el.removeClass('select');
      prekix.PubSub.trigger('subtask_menu_item_deselect', this.subtask);
    }
  });
})(jQuery);