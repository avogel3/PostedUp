# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding database....."

5.times do |g|
  puts "Creating user number #{User.count + 1}"
  @user = FactoryGirl.create(:user)
  5.times do |n|
      puts "Creating post number #{Post.count + 1}"
      @user.posts.create(FactoryGirl.attributes_for(:public_post))
  end
end

puts "---------------------"
puts "All Done!!"
