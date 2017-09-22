# frozen_string_literal: true

namespace :db do
  task populate: 'db:setup' do
    puts 'Populating database.....'

    5.times do |_g|
      puts "Creating user number #{User.count + 1}"
      @user = FactoryGirl.create(:user)
      5.times do |_n|
        puts "Creating post number #{Post.count + 1}"
        @user.posts.create(FactoryGirl.attributes_for(:public_post))
      end
    end

    puts '---------------------'
    puts 'All Done!!'
  end
end
