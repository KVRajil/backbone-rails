class Blog.Routers.PostsRouter extends Backbone.Router

  initialize: (options) ->
    @posts = new Blog.Collections.PostsCollection()
    @posts.reset options.posts

  routes:
    "index"       : "index"
    "new"         : "newPost"
    "posts"       : "index"
    "posts/:id"         : "show"
    "posts/:id/edit"    : "edit"
    ".*"          : "index"

  index: ->
    @view = new Blog.Views.PostsIndexView({collection: @posts})

  newPost: ->
    @view = new Blog.Views.PostsNewView({collection: @posts})

  show: (id) ->
    post = @posts.get(id)
    #console.log model
    @view = new Blog.Views.PostsShowView({model: post})

  edit: (id) ->
    post = @posts.get(id)
    @view = new Blog.Views.PostsEditView({model: post})
