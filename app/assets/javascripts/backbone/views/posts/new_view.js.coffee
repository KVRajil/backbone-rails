class Blog.Views.PostsNewView extends Backbone.View
 el: '#posts'

 template: JST["backbone/templates/posts/new"]

 events:
   "submit #new-post": "save"
   "click .test": "alertTest"

 initialize: ->
   @render()

 render: ->
   @$el.html @template()

 save: (e) ->
   e.preventDefault()
   e.stopPropagation()
   title = $('#title').val()
   content = $('#content').val()
   model = new Blog.Models.Post({title: title, content: content})
   @collection.create model,
    success: (post) =>
      @model = post
      console.log "created"
      window.location.hash = "/#{@model.id}"

  alertTest: (e) ->
    e.preventDefault()
    console.log $(e.currentTarget)
    msg=$(e.currentTarget).attr("data-form-id")
    msg2=$(e.currentTarget).data("form-id")
    console.log msg
    console.log msg2
