class CommentsController < ApplicationController

  def create
  	@topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments

  	@comment = current_user.comments.build(params[:comment])
  	@comment.post = @post
  	
    if @comment.save
      redirect_to [@topic, @post], notice: "Post was saved successfully."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render 'posts/show'
    end
  end
end
