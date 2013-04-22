var prekix = prekix || {};
prekix.routers = prekix.routers || {};

(function(){
  var Workspace = Backbone.Router.extend({
    routes: {
      "projects/:id": "getProject"
    },

    getProject: function(id){
      prekix.curProjectId = id;
      prekix.ProjectModel.fetch({id:id});
    }

  });
  prekix.PrekixRouter = new Workspace();
})();