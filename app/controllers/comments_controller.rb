class CommentsController < ApplicationController

  def create
      @post = Post.find(params[:post_id])
      @topic = @post.topic
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

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:post)
  end
end
