var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.SubtaskMenu = Backbone.View.extend({
    initialize: function(options){
      this.category = options.category;
      this.pubsub = options.pubsub;
      this.setEventListeners();
    },

    setEventListeners: function(){
      _.bindAll(this, 'onCategoryButtonSelect');
      _.bindAll(this, 'onCategoryButtonDeselect');
      prekix.PubSub.on('category_button_select', this.onCategoryButtonSelect);
      prekix.PubSub.on('category_button_deselect', this.onCategoryButtonDeselect);
    },

    onCategoryButtonSelect: function(category){
      if (this.category === category){
        this.show();
      }
    },

    onCategoryButtonDeselect: function(category){
      if (this.category === category){
        this.hide();
      }
    },

    show: function(){
      this.$el.slideDown(500, function(){

      });
    },

    hide: function(){
      this.$el.slideUp(500, function(){

      });
    }

  });
})(jQuery);