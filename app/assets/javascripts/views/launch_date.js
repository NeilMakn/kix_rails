var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.LaunchDate = Backbone.View.extend({
    el: '#flag',
    initialize: function(){
      // this.launchDate = options.launchDate;
      this.defaultTemplate = '<h3>Set Launch Date</h3>';
      this.inputTemplate = '<input type="text" size="10" placeholder="00/00/00">';
      this.render(this.defaultTemplate);
    },

    events: {
      'click h3': 'onClick',
      'focusout input': 'onFocusOut',
      'keydown input': 'onKeyDown'
    },

    onFocusOut: function(e){
      this.render(this.defaultTemplate);
    },

    onKeyDown: function(e){
      var target = e.currentTarget;
      $(target).val($(target).replace());

      // If user presses enter, check the date and save to datebase.
      if(e.which === 13){
        console.log("Enter Key Pressed");
        // if(this.checkDate($(target).val())){
        //  this.model.save('launch_date': this.launchDate);
        // }
      }
      // If user presses esc key exit the input box.
      if(e.which === 27){
        e.currentTarget.blur();
      }
    },

    onClick: function(e){
      this.render(this.inputTemplate);
    },

    render: function(template){
      this.$el.html(template);
    }
  });
})(jQuery);