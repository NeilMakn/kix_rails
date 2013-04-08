var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.SubtaskMenuItem = Backbone.View.extend({
    selected: false,

    initialize: function(options){
      this.category = options.category;
      this.subtask = options.subtask;
      this.pubsub = options.pubsub;
      this.setEventListeners();
    },

    setEventListeners: function(){
      //
    },

    events: {
      'click' : 'onClick'
    },

    onClick: function(e){
      if (this.select === false){
        this.select();
      }else{
        this.deselect();
      }
    },

    select: function(){
      this.select = true;
      this.$el.addClass('select');
    },

    deselect: function(){
      this.select = false;
      this.$el.removeClass('select');
    }

  });
})(jQuery);