class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite
    if favorite.save
      flash[:notice] = "Successfully favorited!"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error favoriting this post. Please try again."
      redirect_to [@post.topic, @post]
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)

    authorize favorite
    if favorite.destroy
      flash[:notice] = "Successfully unfavorited."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error unfavoriting this post. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

end
