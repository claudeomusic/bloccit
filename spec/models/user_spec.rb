require 'rails_helper'

describe User do 

  include TestFactories

  before do
      @post_favorite = associated_post
      @post_notfavorite = associated_post
      @user = authenticated_user
      @user.favorites.where(post: @post_favorite).create
    end

  describe "#favorited(post)" do 
      it "returns 'nil' if the user has not favorited the post" do
        expect(@user.favorited(@post_notfavorite)).to eq(nil)
      end

      it "returns the appropriate favorite if it exists" do
        expect(@user.favorited(@post_favorite).class).to eq(Favorite)
      end

  end
end