var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.ProgressBarCategory = Backbone.View.extend({
    el: '#progress-bar-main',
    initialize:function(options){
      this.category  = options.category;
      this.badge     = options.badge;
      this.taskTotal = 5;
      this.tasksComplete = 0;
      this.setEventListeners();
    },

    setEventListeners: function(){
      this.listenTo(prekix.Tasks, 'add', this.setUp);
      this.listenTo(prekix.Tasks, 'change:completed', this.increment);
    },

    checkCategory: function(taskType){
      var category = prekix.helpers.getCategoryByTaskType(taskType);
      return (category === this.category) ? true : false;
    },

    setBadgeState: function(){
      if(this.tasksComplete === this.taskTotal){
        this.badge.setComplete();
      }else{
        this.badge.setIncomplete();
      }
    },

    setUp: function(model){
      var taskType = model.get('type_task');

      if (this.checkCategory(taskType)){
        var toggleState = model.get('completed');
        if(toggleState !== 0 && toggleState !== null){
          this.tasksComplete++;
        }
        this.render();
      }
    },

    increment: function(model){
      var taskType = model.get('type_task');

      if (this.checkCategory(taskType)){
        var toggleState = model.get('completed');
        this.tasksComplete += (toggleState === 1)? 1 : -1;
        this.render();
      }
    },

    render: function(){
      this.$el.children('li').removeClass('complete');
      this.$el.children('li:nth-child(-n+' + this.tasksComplete + ')').addClass('complete');
      this.setBadgeState();
    }
  });
})(jQuery);
