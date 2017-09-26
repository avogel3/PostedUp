FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'Password1234' }
    password_confirmation { 'Password1234' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    preferred_timezone { ActiveSupport::TimeZone.all.map(&:name).sample }
  end

  factory :invalid_user, class: User do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'InValid_PassW0Rd' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    preferred_timezone { ActiveSupport::TimeZone.all.map(&:name).sample }
  end
end
