var prekix = prekix || {};

(function($){
  prekix.CategoryButton = Backbone.View.extend({
    initialize: function(options){
      // _.bindAll(this);
      this.category = options.category;
      this.pubsub = options.pubsub;
    },

    events: {
      'click': 'categoryClick'
    },

    categoryClick: function(e){
      if (this.$el.hasClass("select")){
        this.setDeselected();
      }else{
        this.setSelected();
      }
    },

    setSelected: function(context){
      this.$el.addClass('select');
      this.$el.children('.dotted').children('li').addClass('select');
      this.pubsub.trigger('category_button_select', this.category);
    },

    setDeselected: function(context){
      this.$el.removeClass('select');
      this.$el.children('.dotted').children('li').removeClass('select');
      this.pubsub.trigger('category_button_deselect', this.category);
    }

  });
})(jQuery);