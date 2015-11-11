class Blog.Views.PostsIndexView extends Backbone.View

  el: '#posts'


  template: JST["backbone/templates/posts/index"]

  initialize: ->
      @render()
      @addAll()
  events:
    "click .show_post" : "showPost"

  addAll: ->
      @collection.forEach(@addOne, @)

  addOne: (model) ->
      @view = new Blog.Views.PostView({model: model})
      @$el.find('tbody').append @view.render().el

  showPost: (e) ->
    p =$(e.currentTarget).attr("data-post-id")
    window.location="/#/posts/#{p}"

  render: ->
      @$el.html @template()
      @
