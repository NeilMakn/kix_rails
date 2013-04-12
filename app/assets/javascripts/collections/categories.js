var prekix = prekix || {};
prekix.collections = prekix.collections || {};

(function($){
  prekix.collections.Categories = Backbone.Collection.extend({
    model: prekix.models.Category,
    fetch: function(){
      var _self = this;
      _.each(prekix.CATEGORIES, function(element, index, list){
        _self.add({category:element});
      });
    }
  });
})(jQuery);