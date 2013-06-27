var Keroauc = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(data){
    new Keroauc.Routers.Tasks();
    Backbone.history.start();
  }
};
