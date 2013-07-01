Keroauc.Views.TaskView = Backbone.View.extend({
  tagName: 'div',
  events: {
    'click .complete-check-box' : 'completeTask'
  },
  initialize: function(){
    this.model.on('change', this.render, this);
  },
  render: function(){
    this.$el.html(JST['tasks/task']({ model: this.model }));
    return this;
  },
  completeTask: function(event) {
    event.preventDefault();
    this.model.set({complete: true});
    this.model.save();
  }
});
