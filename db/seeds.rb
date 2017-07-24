10.times do
  user = User.create(email: Faker::Internet.email, password: 'password')
  2.times do
    user.posts.create(title: Faker::Lorem.sentence,
                     content: Faker::Markdown.random,
                    posted_date: Faker::Date.between(2.years.ago, Date.today))
  end
end
