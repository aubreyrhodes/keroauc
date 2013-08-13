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
    this.calendar = this.$('.due-date-calendar').kalendae();
    return this;
  },
  saveRecurrence: function(event){
    event.preventDefault();
    this.bindFrequency();
    this.model.save();
  },
  bindFrequency: function(){
    var frequency = this.$('input[name=recurrence_frequency]:checked').val();
    this.model.set({'frequency' : frequency});
  }
});
