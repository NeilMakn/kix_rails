var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.LaunchDateDisplay = Backbone.View.extend({
    el: '#flag',
    initialize: function(options){
      this.defaultText = '<h3>Set Launch Date</h3>';
      this.template = this.defaultText;
      this.render(this.template);
      this.setEventListeners();
    },

    events: {
      'click h3': 'onClick',
      'click h2': 'onClick'
    },

    setEventListeners: function(){
      this.listenTo(this.model, "change", this.onModelChange);
      _.bindAll(this, 'onLaunchDateInputFocusout');
      prekix.PubSub.on('launch_date_input_focusout', this.onLaunchDateInputFocusout);
    },

    onLaunchDateInputFocusout: function(e){
      this.render();
    },

    setDaysLeft: function(launchDateStr){
      launchDate = moment(launchDateStr, ["YYYY-MM-DD"]);
      if(launchDate.isValid()){
        var daysLeft = this.getDaysLeft(launchDate);
        this.template = '<h2>' + daysLeft + ' days left</h2>';
        this.render();
      }else{
        console.log("Date not valid.");
      }
    },

    getDaysLeft: function(launchDate){
        var now = moment();
        return launchDate.diff(now, 'days');
    },

    onModelChange: function(model){
      this.setDaysLeft(model.get('launch_date'));
    },

    onClick: function(e){
      var context = e.currentTarget;
      prekix.PubSub.trigger('launch_date_display_click', context);
    },

    render: function(){
      this.$el.html(this.template);
    }
  });
})(jQuery);