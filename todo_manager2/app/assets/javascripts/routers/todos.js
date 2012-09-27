TodoManager.Routers.Todos = Backbone.Router.extend({

  initialize: function(options) {
    this.todos = options.collection;
  },
  routes: { "": "index" },

  index: function() {
    new TodoManager.Views.TodosIndex({ el: $("#todoapp"), collection: this.todos });
  },
});
