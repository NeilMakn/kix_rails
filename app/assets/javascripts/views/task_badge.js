var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskBadge = Backbone.View.extend({
    initialize: function(options){
      this.category = options.category;
      this.task     = options.task;
      this.model    = options.model;
      this.setEventListeners();
      this.render();
    },

    setEventListeners: function(){
      this.listenTo(this.model, 'change:completed', this.render);
    },

    render:function(){
      var toggleState = this.model.get('completed');
      // toggle state is either 1 or a datetime when true
      // and null or 0 when false.
      if(toggleState === 0 || toggleState === null){
        this.$el.removeClass('complete').addClass('incomplete');
      }else{
        this.$el.removeClass('incomplete').addClass('complete');
      }
    }
  });
})(jQuery);