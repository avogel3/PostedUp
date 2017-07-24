10.times do
  user = User.create(email: Faker::Internet.email, password: 'password')
  2.times do
    user.posts.create(FactoryGirl.attributes_for(:post))
  end
end
