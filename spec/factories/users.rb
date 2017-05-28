# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  preferred_timezone     :string
#

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { "Password1234" }
    password_confirmation { "Password1234" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    preferred_timezone { ActiveSupport::TimeZone.all.map(&:name).sample }
  end

  factory :invalid_user, class: User do
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "InValid_PassW0Rd" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    preferred_timezone { ActiveSupport::TimeZone.all.map(&:name).sample }
  end
  
end
