var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.CategoryButton = Backbone.View.extend({
    selected: false,
    initialize: function(options){
      // _.bindAll(this);
      this.category = options.category;
      this.pubsub = options.pubsub;
      this.setEventListeners();
    },

    setEventListeners: function(){
      _.bindAll(this, 'onCategoryButtonSelect');
      this.pubsub.bind('category_button_select', this.onCategoryButtonSelect);
    },

    events: {
      'click': 'onClick'
    },

    onClick: function(e){
      if (this.selected === false){
        this.select();
      }else{
        this.deselect();
      }
    },

    select: function(){
      this.selected = true;
      this.$el.addClass('select');
      this.$el.children('.dotted').children('li').addClass('select');
      this.pubsub.trigger('category_button_select', this.category);
    },

    deselect: function(){
      this.selected = false;
      this.$el.removeClass('select');
      this.$el.children('.dotted').children('li').removeClass('select');
      this.pubsub.trigger('category_button_deselect', this.category);
    },

    // We call this do deselect all category buttons that are not
    // the currently selected category button.
    onCategoryButtonSelect: function(category){
      if(this.category !== category && this.selected === true){
        this.deselect();
      }
    }
  });
})(jQuery);