TodoManager.Models.Todo = Backbone.Model.extend({

    defaults: function() {
      return {
        title: "empty todo...",
        order: TodoManager.todos.nextOrder(),
        done: false
      };
    },

    // Ensure that each todo created has `title`.
    initialize: function() {
      if (!this.get("title")) {
        this.set({"title": this.defaults().title});
      }
    },

    // Toggle the `done` state of this todo item.
    toggle: function() {
      this.save({done: !this.get("done")});
    },

    clear: function() {
      this.destroy();
    }
});
