var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.LaunchDate = Backbone.View.extend({
    el: '#flag',
    initialize: function(options){
      // this.launchDate = options.launchDate;
      this.setEventListeners();
      this.defaultTemplate = '<h3>Set Launch Date</h3>';
      this.inputTemplate = '<input type="text" size="10" placeholder="mm/dd/yy">';
      this.outputTemplate = null;
      this.render(this.defaultTemplate);
      this.convertInputToDateTime('04/28/13');
    },

    events: {
      'click h3': 'onClick',
      'focusout input': 'onFocusOut',
      'keydown input': 'onKeyDown'
    },

    setEventListeners: function(){
      this.listenTo(this.model, "change", this.onModelChange);
    },

    setDaysLeft: function(launchDateStr){
      if(this.checkDateFormat(launchDateStr)){
        launchDate = this.convertInputToDateTime(launchDateStr);
        var daysLeft = Math.floor(this.getDaysLeft(launchDate));
        this.outputTemplate = this.setOutputTemplate(daysLeft);
        this.render(this.outputTemplate);
      }else{
        console.log("Incorrect Date Format");
      }
    },

    checkDateFormat: function(launchDate){
      var regex = new RegExp(/((([0-9]{2})+\/){2})+([0-9]{2})/);
      return regex.test(launchDate);
    },

    convertInputToDateTime: function(launchDate){
      var dateNums = launchDate.split('/');
      dateNums = _.map(dateNums, function(dNum){
        return parseInt(dNum, 10);
      });
      var year  = dateNums[2] + 2000;
      var month = dateNums[0] - 1;
      var day   = dateNums[1];
      var date  =  new Date(year, month, day);
      console.log(date);
    },

    getDaysLeft: function(launchDate){
      var nowDate = new Date();
      var dateDiff = launchDate - nowDate;
      var daysLeft = dateDiff / 1000 / 60 / 60 / 24;
      return daysLeft;
    },

    setOutputTemplate: function(daysLeft){
      return '<h2>' + daysLeft + ' days left</h2>';
    },

    onModelChange: function(model){
      this.setDaysLeft(model.launch_date);
    },

    onFocusOut: function(e){
      this.render(this.defaultTemplate);
    },

    onKeyDown: function(e){
      var target = e.currentTarget;
      // only allow numbers and forward slash

      // If user presses enter, check the date and save to datebase.
      if(e.which === 13){
        console.log("Enter Key Pressed");
        // if(this.checkDateFormat($(target).val())){
        // this.model.save('launch_date': this.launchDate);
        // }
        // this.setDaysLeft($(target).val());
        // this.convertInputToDateTime($(target).val());
      }
      // If user presses esc key exit the input box.
      if(e.which === 27){
        e.currentTarget.blur();
      }
    },

    onClick: function(e){
      this.render(this.inputTemplate);
      // need to focus on the input template
    },

    render: function(template){
      this.$el.html(template);
    }
  });
})(jQuery);