class Blog.Views.CommentShowView extends Backbone.View
  template: JST["backbone/templates/comments/comment_template"]
  tagName: "div"
  className : 'each_comment'


  initialize: (options) ->
    @comment = options.comment
    # $(@el).undelegate(".delete_button","click")

  events:
    "click .delete_button" : "deleteComment"

  deleteComment: (e) ->
    $.ajax({
      url: "/posts/#{@comment.attributes.post_id}/comments/#{@comment.id}"
      type: "delete"
      dataType: "json"
      success:(data,textStatus,jqXHR) =>
        $(".comment#{@comment.id}").parents(".each_comment").remove()
      })

  render: () ->
    $(@el).html(@template(@comment.toJSON()))
    return this
