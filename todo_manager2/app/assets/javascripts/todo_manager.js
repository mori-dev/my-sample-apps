window.TodoManager = {

  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  init: function() {

    this.todos = new TodoManager.Collections.Todos;
    new TodoManager.Routers.Todos({ collection: this.todos });

    if (!Backbone.history.started) {
      Backbone.history.start();
      Backbone.history.started = true;
    }
  },
};

$(document).ready(function() {
  TodoManager.init();
});