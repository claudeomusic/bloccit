class CommentsController < ApplicationController

  def create
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.find(params[:post_id])
      @comments = @post.comments
      @comment = current_user.comments.build(params.require(:comment).permit!)
      @comment.post = @post

      authorize @comment

      if @comment.save
        flash[:notice] = "Comment was created."
        redirect_to [@topic, @post]
      else
        flash[:error] = "There was an error saving the comment. Please try again."
        render 'posts/show'
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:post)
  end
end
