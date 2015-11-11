class Blog.Models.Post extends Backbone.Model
  paramRoot: 'post'



class Blog.Collections.PostsCollection extends Backbone.Collection
  model: Blog.Models.Post
  url: '/posts'
