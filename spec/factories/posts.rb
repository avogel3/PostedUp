# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  posted_date :datetime
#  published   :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

FactoryGirl.define do
  factory :public_post, class: Post do
    title { Faker::Lorem.sentence }
    content { Faker::Markdown.random }
    published true
    posted_date { Faker::Date.between(2.days.ago, Date.today) }
    image { Faker::File.file_name }
  end

  factory :draft, class: Post do
    title { Faker::Lorem.sentence }
    content { Faker::Markdown.random }
    published false
    image { Faker::File.file_name }
  end

  factory :invalid_post, class: Post do
    title nil
    content nil
  end
  
end
