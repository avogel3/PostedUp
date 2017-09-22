# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

password = 'password'

if Rails.env.production?
  password = ENV.fetch('SEED_USER_PASSWORD')
end

User.create!(first_name: 'Admin',
             last_name: 'User',
             preferred_timezone: 'Eastern',
             email: 'admin@example.com',
             password: password,
             password_confirmation: password)
