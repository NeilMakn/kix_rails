var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskToggle = Backbone.View.extend({
    initialize:function(options){
      this.model = options.model;
      this.category = options.category;
      this.subtask = options.subtask;
    },

    events: {
      'change': 'onChange'
    },

    onChange: function(e){
      this.updateModel();
    },

    updateModel: function(){
      var toggleVal = this.$el.val();
      this.model.set('completed', toggleVal);
    }

  });
})(jQuery);