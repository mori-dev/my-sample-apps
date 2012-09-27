TodoManager.Views.TodosTodo = Backbone.View.extend({

  template: JST['todos/todo'],

  tagName:  "li",

  events: {
    "click .toggle"   : "toggleDone",
    "dblclick .view"  : "edit",
    "click a.destroy" : "clear",
    "keypress .edit"  : "updateOnEnter",
    "blur .edit"      : "close"
  },

  // The TodoView listens for changes to its model, re-rendering. Since there's
  // a one-to-one correspondence between a **Todo** and a **TodoView** in this
  // app, we set a direct reference on the model for convenience.
  initialize: function() {
    this.model.on('change', this.render, this);
    this.model.on('destroy', this.remove, this);
  },

  // Re-render the titles of the todo item.
  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    this.$el.toggleClass('done', this.model.get('done'));
    this.input = this.$('.edit');
    return this;
  },

  toggleDone: function() {
    this.model.toggle();
  },

  // Switch this view into `"editing"` mode, displaying the input field.
  edit: function() {
    this.$el.addClass("editing");
    this.input.focus();
  },

  // Close the `"editing"` mode, saving changes to the todo.
  close: function() {
    var value = this.input.val();
    if (!value) this.clear();
    this.model.save({title: value});
    this.$el.removeClass("editing");
  },

  updateOnEnter: function(e) {
    if (e.keyCode == 13) this.close();
  },

  clear: function() {
    this.model.clear();
  }
});
