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
#

FactoryGirl.define do
  factory :public_post, class: Post do
    title { Faker::Lorem.words(rand(9)) }
    content { Faker::Markdown.random }
    published true
    posted_date { Faker::Date.between(2.days.ago, Date.today) }
  end

  factory :draft, class: Post do
    title { Faker::Lorem.words(rand(9)) }
    content { Faker::Markdown.random }
  end
end
