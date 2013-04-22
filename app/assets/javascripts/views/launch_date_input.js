var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.LaunchDateInput = Backbone.View.extend({
    el: '#flag',
    initialize: function(options){
      this.setEventListeners();
      this.template = '<input type="text" size="10" placeholder="mm/dd/yy">';
    },

    events: {
      'focusout input': 'onFocusOut',
      'keydown input': 'onKeyDown'
    },

    setEventListeners: function(){
      _.bindAll(this, 'onLaunchDateDisplayClick');
      prekix.PubSub.on('launch_date_display_click', this.onLaunchDateDisplayClick);
    },

    onLaunchDateDisplayClick: function(context){
      this.render();
    },

    onFocusOut: function(e){
      var context = e.currentTarget;
      prekix.PubSub.trigger('launch_date_input_focusout', context);
    },

    onKeyDown: function(e){
      var context = e.currentTarget;
      // only allow numbers and forward slash

      // If user presses enter, check the date and save to datebase.
      if(e.which === 13){
        this.saveLaunchDate($(context).val(), context);
      }
      // If user presses esc key exit the input box.
      if(e.which === 27){
        context.blur();
        prekix.PubSub.trigger('launch_date_input_focusout', context);
      }
    },

    saveLaunchDate: function(launchDateStr, context){
      var launchDate  = moment(launchDateStr, "MM-DD-YY");
      if(this.validateLaunchDate(launchDate)){
        var datetimeStr = launchDate.format();
        this.model.set({'launch_date':datetimeStr});
        this.model.save();
        prekix.PubSub.trigger('launch_date_input_focusout', context);
      }
    },

    validateLaunchDate: function(launchDate){
      if(launchDate > moment()){
        return true;
      }
      return false;
    },

    render: function(){
      this.$el.html(this.template);
      this.$el.find('input').focus();
    }
  });
})(jQuery);