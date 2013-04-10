var prekix = prekix || {};

$(function() {
  // $.each(prekix.CATEGORIES, function(index, category){
  //   initializeCategoryButtons(category);
  //   // initializeCategoryBadges(category);
  //   // initializeCategoryProgressBars(category);
  //   initializeCategoryMenus(category);
  // });

  // function initializeCategoryButtons(category) {
  //   var catId = '#' + category;
  //   var el = $(catId).find('.cat-button').get(0);
  //   var catButton = new prekix.views.CategoryButton({el:el, category: category, pubsub: pubsub});
  // }

  // function initializeCategoryProgressBars(category){
  //   var catId = '#' + category;
  //   var el = $(catId).find('.dotted').get(0);
  // }

  // function initializeCategoryBadges(category){
  //   var catId = '#' + category;
  //   var el = $(catId).find('.category-badge').get(0);
  // }

  // function initializeCategoryMenus(category){
  //   var catId = '#' + category;
  //   var el = $(catId).find('.subtasks').get(0);
  //   var subtaskMenu = new prekix.views.SubtaskMenu({el:el, category: category, pubsub: pubsub});
  // }

  $('.subtasks').hide();
  //
  prekix.PubSub = {};
  _.extend(prekix.PubSub, Backbone.Events);
  //
  prekix.Tasks = new prekix.collections.Tasks();
  prekix.app = new prekix.views.App();
});
