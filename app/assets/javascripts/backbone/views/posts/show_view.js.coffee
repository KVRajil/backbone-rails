class Blog.Views.PostsShowView extends Backbone.View

  template: JST["backbone/templates/posts/show"]

  el: '#posts'

  initialize: ->
    @render()

  events:
    "click #add_comment_button" : "addCommentForm"
    "submit #new_comment" : "createComment"

  createComment:(e) ->
    e.preventDefault()
    source = $(e.currentTarget)
    comment_body =source.find("#comment_body").val()
    post_id = @model.id
    $.ajax({
      url: "/posts/#{post_id}/comments"
      type: "post"
      data: {comment:{body:comment_body}}
      })
  loop_comment: (comments) =>
      for comment in comments.models
        @addOne(comment)

  addOne: (comment) =>
    console.log comment
    comment_view = new Blog.Views.CommentShowView({comment:comment})
    $(".list_comments").append(comment_view.render().el)

  listComments: () ->
    comments = new Blog.Collections.CommentsCollection({post_id:@model.id})
    comments.fetch(success : @loop_comment)

    # $.ajax({
    #   url: "/posts/#{@model.id}/comments"
    #   type: "get"
    #   dataType: "json"
    #   success: (data,textStatus,jqXHR) =>
    #     console.log data.comments
    #     for comment in data.comments
    #       @addComment(comment)
    #
    #   })

  addCommentForm: ->
    post_id = @model.id
    $.get("/posts/#{post_id}/comments/new")

  render: ->
    @$el.html(@template(@model.toJSON()))
    @listComments()
