var prekix = prekix || {};
prekix.collections = prekix.collections || {};

(function(){
  prekix.collections.Tasks = Backbone.Collection.extend({
    model: prekix.models.Task,
    url: '/tasks'
  });
})();