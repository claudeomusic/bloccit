require 'rails_helper'

describe "Visiting profiles" do 

  include TestFactories
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = FactoryGirl.create(:user)
    @user.save
    @post = FactoryGirl.create(:post, user: @user)
    @comment_without_email = FactoryGirl.create(:comment, user: @user, post: @post)
    allow(@comment_without_email).to receive(:send_favorite_emails)
    @comment_without_email.save
  end

  describe "not signed in" do

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment_without_email.body)
    end
  end

  

  describe "signed in" do

    before do
      login_as(@user, :scope => :user)
    end

    it "shows own profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment_without_email.body)
    end
  end
  
end