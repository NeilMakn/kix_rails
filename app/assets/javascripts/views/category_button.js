var prekix = prekix || {};
prekix.views = prekix.views || {};

(function($){
  prekix.views.CategoryButton = Backbone.View.extend({
    selected: false,
    initialize: function(options){
      this.category    = options.category;
      this.badge       = this.addCategoryBadge(this.category);
      this.progressBar = this.addProgressBar(this.category, this.badge);
      this.setEventListeners();
    },

    setEventListeners: function(){
      _.bindAll(this, 'onCategoryButtonSelect');
      prekix.PubSub.on('category_button_select', this.onCategoryButtonSelect);
      // prekix.PubSub.on('category_button_deselect', this.onCategoryButtonDeselect);
    },

    events: {
      'click': 'onClick'
    },

    addProgressBar: function(category, badge){
      var el = this.$el.find('.progress-bar');
      var options = {
        el: el,
        badge: badge,
        category: category
      };
      return new prekix.views.ProgressBarCategory(options);
    },

    addCategoryBadge: function(category){
      var el = this.$el.find('.category-badge');
      var options = {
        el: el,
        category: category
      };
      return new prekix.views.CategoryBadge(options);
    },

    onClick: function(e){
      if (this.selected === false){
        this.select();
      }else{
        this.deselect();
      }
      prekix.PubSub.trigger('category_button_click', this.category);
    },

    // We call this do deselect all category buttons that are not
    // the currently selected category button.
    onCategoryButtonSelect: function(category){
      if(this.category !== category && this.selected === true){
        this.deselect();
      }
    },

    select: function(){
      this.selected = true;
      this.$el.addClass('select');
      this.$el.children('.progress-bar').children('li').addClass('select');
      prekix.PubSub.trigger('category_button_select', this.category);
    },

    deselect: function(){
      this.selected = false;
      this.$el.removeClass('select');
      this.$el.children('.progress-bar').children('li').removeClass('select');
      prekix.PubSub.trigger('category_button_deselect', this.category);
    }
  });
})(jQuery);