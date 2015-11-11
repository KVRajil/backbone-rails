class Blog.Models.Comment extends Backbone.Model
  paramRoot: 'comment'



class Blog.Collections.CommentsCollection extends Backbone.Collection
  model: Blog.Models.Comment
  initialize: (options) ->
    @post_id = options.post_id if options? and options.post_id?


  url: ->
    if @post_id
        '/posts/'+@post_id+'/comments/'
    else
      '/comments/'
