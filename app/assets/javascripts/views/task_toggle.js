var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.TaskToggle = Backbone.View.extend({
    initialize:function(options){
      this.parent   = options.parent;
      this.model    = options.model;
      this.category = options.category;
      this.subtask  = options.subtask;
    },

    events: {
      'change': 'onChange'
    },

    onChange: function(e){
      var target = e.currentTarget;
      var toggleState = parseInt($(target).val(), 10);
      this.model.save('completed', toggleState);
    }
  });
})(jQuery);