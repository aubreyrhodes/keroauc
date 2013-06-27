Keroauc.Views.TasksIndex = Backbone.View.extend({
  initialize: function(){
    this.collection.on('sync', this.render, this);
  },

  render: function() {
    this.$el.html(JST['tasks/index']({ tasks: this.collection }));
    return this;
  }
});
