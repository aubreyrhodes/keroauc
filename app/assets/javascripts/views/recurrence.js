Keroauc.Views.RecurrenceView = Backbone.View.extend({
  tagName: 'div',
  attributes: {
    class: 'recurrence'
  },
  events: {
    'click .save' : 'saveRecurrence'
  },
  render: function(){
    this.$el.html(JST['recurrences/recurrence']({model: this.model}));
    var due_date = this.options.task.get('due_date');
    this.calendar = this.$('.due-date-calendar').kalendae({selected: due_date});
    return this;
  },
  saveRecurrence: function(event){
    event.preventDefault();
    this.bindFrequency();
    this.bindDueDate();
    this.model.save();
    this.options.task.save();
  },
  bindFrequency: function(){
    var frequency = this.$('input[name=recurrence_frequency]:checked').val();
    this.model.set({'frequency' : frequency});
  },
  bindDueDate: function(){
    var date = this.$('.k-selected').data('date');
    this.options.task.set({'due_date' : date});
  }
});
