require 'rails_helper'

describe Vote do
  
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        v = Vote.new(value: 1)
        v2 = Vote.new(value: -1)
        bad_v = Vote.new(value: 2)
        expect(v.valid?).to eq(true)
        expect(v2.valid?).to eq(true)
        expect(bad_v.valid?).to eq(false)
      end
    end
  end

  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      @user = create(:user)
      post = create(:post, user: @user)
      vote = Vote.new(value: 1, post:post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end

end