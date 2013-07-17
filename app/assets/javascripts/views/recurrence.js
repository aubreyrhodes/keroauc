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
    return this;
  },
  saveRecurrence: function(event){
    event.preventDefault();
    this.model.save();
  }
});
