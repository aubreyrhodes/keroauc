Keroauc.Models.Recurrence = Backbone.Model.extend({
  urlRoot: '/recurrences',
  toJSON: function() {
    return { recurrence: _.clone( this.attributes ) }
  }
});
