Keroauc.Views.TasksIndex = Backbone.View.extend({
  initialize: function(){
    this.collection.on('sync', this.render, this);
  },

  events: {
    'submit #new-task': 'createTask'
  },

  render: function() {
    var self = this;
    this.$el.html(JST['tasks/index']());

    this.collection.each( function(task){
      var taskView = new Keroauc.Views.TaskView({ model: task} );
      self.$('ol').append(taskView.render().el);
    });

    self.$('#new-task-title').focus();

    return this;
  },

  createTask: function(event){
    event.preventDefault();
    this.collection.create({ title: $('#new-task-title').val() });
  }
});
