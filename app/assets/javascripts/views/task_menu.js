var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.SubtaskMenu = Backbone.View.extend({
    initialize: function(options){
      this.category = options.category;
      this.pubsub = options.pubsub;
      this.setEventListeners();
      this.$el.hide();
    },

    setEventListeners: function(){
      _.bindAll(this, 'addOne');
      this.listenTo(prekix.Tasks, 'add', this.addOne);
      _.bindAll(this, 'onCategoryButtonSelect');
      prekix.PubSub.on('category_button_select', this.onCategoryButtonSelect);
      _.bindAll(this, 'onCategoryButtonDeselect');
      prekix.PubSub.on('category_button_deselect', this.onCategoryButtonDeselect);
    },

    addOne: function(model){
      var subtask = prekix.TYPES[model.get('type_task')];
      var category = this.category;
      var el = '#' + subtask;
      var options = {el: el, category:category, subtask:subtask, model:model};
      this.subtask = new prekix.views.SubtaskMenuItem(options);
    },

    onCategoryButtonSelect: function(category){
      if (this.category === category){
        this.show();
      }
    },

    onCategoryButtonDeselect: function(category){
      if (this.category === category){
        this.hide();
      }
    },

    show: function(){
      this.$el.slideDown(500);
    },

    hide: function(){
      this.$el.slideUp(500);
    }
  });
})(jQuery);