FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Markdown.random }
    posted_date { Faker::Date.between(2.years.ago, Date.today) }
    association :user
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/placeholdit-450.png'))) }
  end
end
