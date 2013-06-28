Keroauc.Views.TaskView = Backbone.View.extend({
  tagName: 'li',
  initialize: function(){
    this.model.on('change', this.render, this);
  },
  render: function(){
    this.$el.html(JST['tasks/task']({ model: this.model }));
    return this;
  }
});
