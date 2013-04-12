var prekix = prekix || {};

$(function() {
  //
  var formTemplateSource = $("#form-template").html();
  prekix.handlebarsTaskForm = Handlebars.compile(formTemplateSource);
  prekix.PubSub = {};
  _.extend(prekix.PubSub, Backbone.Events);
  //
  prekix.CategoryList = new prekix.collections.Categories();
  prekix.Tasks = new prekix.collections.Tasks();
  prekix.app = new prekix.views.App();
});
