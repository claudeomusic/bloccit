module TestFactories
  def associated_post(options={})
  post_options = {
    title: 'Post title',
    body: 'Post bodies must be pretty long.',
    topic: Topic.create(name: 'Topic name'),
    user: authenticated_user
  }.merge(options)

  Post.create(post_options)
  end

  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end

  FactoryGirl.define do
    factory :user do
      email 'testing@example.com'
      password 'helloworld'
      password_confirmation 'helloworld'
      confirmed_at Time.now
    end
  end

  FactoryGirl.define do
    factory :comment do
      body "This is a new comment."
      user
      post
    end
  end

  FactoryGirl.define do
    factory :post do
      title "Post title"
      body "bunch of nonsense about posts."
      user
      topic { Topic.create(name: 'Topic name')}
    end
  end

end

