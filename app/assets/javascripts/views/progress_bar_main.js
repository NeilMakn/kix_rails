var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.ProgressBarMain = Backbone.View.extend({
    el: '#progress-bar-main',
    initialize:function(options){
      this.taskTotal = 25;
      this.barMaxWidth = 439;
      this.barIncrement = this.barMaxWidth/this.taskTotal;
      this.tasksComplete = 0;
      this.setEventListeners();
    },

    setEventListeners: function(){
      this.listenTo(prekix.Tasks, 'add', this.setUp);
      this.listenTo(prekix.Tasks, 'change:completed', this.increment);
    },

    getBarWidth: function(){
      return (this.barIncrement * this.tasksComplete) + "px";
    },

    setUp: function(model){
      var toggleState = model.get('completed');
      if(toggleState !== 0 && toggleState !== null){
        this.tasksComplete++;
      }
      this.render();
    },

    increment: function(model){
      var toggleState = model.get('completed');
      this.tasksComplete += (toggleState === 1)? 1 : -1;
      this.render();
    },

    render: function(){
      this.$el.css('width', this.getBarWidth());
    }
  });
})(jQuery);
