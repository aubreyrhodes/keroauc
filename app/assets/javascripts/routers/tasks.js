Keroauc.Routers.Tasks = Backbone.Router.extend({
  routes: {
    "": "index"
  },

  initialize: function(){
    this.collection = new Keroauc.Collections.Tasks();
  },

  index: function() {
    var view = new Keroauc.Views.TasksIndex({
      collection: this.collection
    });

    $('body').html(view.render().$el);
    this.collection.fetch();
  }
});
