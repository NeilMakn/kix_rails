var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.CategoryBadge = Backbone.View.extend({
    initialize: function(options){

    },

    setComplete: function(){
      this.$el.removeClass('incomplete').addClass('complete');
    },

    setIncomplete: function(){
      this.$el.removeClass('complete').addClass('incomplete');
    },

    render: function(){

    }
  });
})(jQuery);