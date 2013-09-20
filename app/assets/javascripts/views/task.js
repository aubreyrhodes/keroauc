Keroauc.Views.TaskView = Backbone.View.extend({
  tagName: 'div',
  events: {
    'click .complete-check-box' : 'completeTask',
    'click .task-header' : 'toggleTask'
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
  },
  toggleTask: function(event) {
    if(this.$el.hasClass('open')){
      this.removeRecurrence();
    } else {
      this.recurrence = this.getRecurrence();
    }
  },
  getRecurrence: function(){
    this.recurrence = new Keroauc.Models.Recurrence();
    if( this.model.get('recurrence_id') ){
      this.recurrence.set({id: this.model.get('recurrence_id')});
      var taskView = this;
      this.recurrence.fetch({ success: function(model){
        taskView.$el.append( (new Keroauc.Views.RecurrenceView({ model: model, task: taskView.model })).render().el);
        window.setStyles();
        taskView.$el.addClass('open');
      }});
    } else {
      this.recurrence.set({'task_id': this.model.get('id')});
      this.$el.append( (new Keroauc.Views.RecurrenceView({ model: this.recurrence, task: this.model })).render().el );
      window.setStyles();
      this.$el.addClass('open');
    }
  },
  removeRecurrence: function(){
    this.$('.recurrence').remove();
    this.$el.removeClass('open');
  }
});
