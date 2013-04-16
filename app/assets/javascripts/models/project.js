var prekix = prekix || {};
prekix.models = prekix.models || {};

(function(){
  prekix.models.Project = Backbone.Model.extend({
    url: '/projects',
    toJSON: function(){
      return { project: _.clone(this.attributes) };
    }
  });
})();