  FactoryGirl.define do
    factory :user do
      name "Douglas Adams"
      sequence(:email, 100) { |n| "person#{n}@example.com"}
      password 'helloworld'
      password_confirmation 'helloworld'
      confirmed_at Time.now


      after(:build) do |user|
        
        post=create(:post,user: user)
        comment=create(:comment,user: user,post: post)
        #binding.pry
      end
    end
  end