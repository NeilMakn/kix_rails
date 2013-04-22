var prekix = prekix || {};
prekix.helpers = prekix.helpers || {};

(function($){
  prekix.helpers = {
    getCategoryByTaskType: function(taskType){
      var taskName = prekix.TYPES[taskType];
      var category = taskName.split('-')[0];
      return category;
    },

    getTaskNameByTaskType: function(taskType){
      var taskName = prekix.TYPES[taskType];
      return taskName;
    }
  };
})(jQuery);