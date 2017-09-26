FactoryGirl.define do
  factory :public_post, class: Post do
    title { Faker::Lorem.sentence }
    content { Faker::Markdown.random }
    post_status "posted"
    posted_date { Time.zone.yesterday + 6.hours  }
    association :user
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/placeholdit-450.png'))) }
  end

  factory :draft, class: Post do
    title { Faker::Lorem.sentence }
    content { Faker::Markdown.random }
    association :user
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/placeholdit-450.png'))) }
  end

  factory :invalid_post, class: Post do
    title nil
    content nil
    association :user
  end

  factory :scheduled_post, class: Post do
    title { Faker::Lorem.sentence }
    content { Faker::Markdown.random }
    post_status "post_later"
    posted_date { Faker::Date.between(2.days.ago, Date.today) }
    association :user
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/placeholdit-450.png'))) }
  end

  factory :updated_post_content, class: Post do
    title { Faker::Lorem.sentence }
    content { Faker::Markdown.random }
    association :user
  end

end
