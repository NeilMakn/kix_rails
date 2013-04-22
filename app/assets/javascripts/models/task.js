var prekix = prekix || {};
prekix.models = prekix.models || {};

(function(){
  prekix.models.Task = Backbone.Model.extend({
    toJSON: function(){
      return { task: _.clone(this.attributes) };
    }
  });
})();