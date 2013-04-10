var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.SubtaskMenuItem = Backbone.View.extend({
    selected: false,

    initialize: function(options){
      this.category = options.category;
      this.subtask = options.subtask;
      this.setEventListeners();
    },

    setEventListeners: function(){
      _.bindAll(this, 'onSubtaskMenuItemSelect');
      prekix.PubSub.on('subtask_menu_item_select', this.onSubtaskMenuItemSelect);
    },

    events: {
      'click' : 'onClick'
    },

    onClick: function(e){
      if (this.selected === false){
        this.select();
      }else{
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