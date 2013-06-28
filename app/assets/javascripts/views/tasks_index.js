Keroauc.Views.TasksIndex = Backbone.View.extend({
  initialize: function(){
    this.collection.on('sync', this.render, this);
  },

  render: function() {
    var self = this;
    this.$el.html(JST['tasks/index']());

    this.collection.each( function(task){
      var taskView = new Keroauc.Views.TaskView({ model: task} );
      self.$('table').append(taskView.render().el);
    });

    return this;
  }
});
