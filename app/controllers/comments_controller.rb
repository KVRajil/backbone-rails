class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    respond_to do |format|
      format.json {render :json => @comments }
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    respond_to do |format|
      format.js
    end
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    respond_to do |format|
      if @comment.save
        format.js
      end
    end


  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.json {render json: {}}
    end
  end
end
