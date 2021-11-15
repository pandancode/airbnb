# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeding users, SO guide and also documentation
# https://stackoverflow.com/questions/12418584/seeding-users-with-devise-in-ruby-on-rails
# https://guides.rubyonrails.org/security.html
counter = 1

puts "Cleaning user database"
User.destroy_all
puts "Cleaning user database: done"

10.times do
  puts "Creating user #{counter}"
  new_user = User.new
  new_user.email = "test#{counter}@test.com"
  # Don't use encrypted_password, this works
  new_user.password = "111111"
  new_user.first_name = "John#{counter}"
  new_user.last_name = "Doe#{counter}"
  new_user.phone_number = "0123467800#{counter}"

  puts new_user.email
  puts new_user.encrypted_password
  puts "Is the user valid? #{new_user.valid?}"
  new_user.save!
  puts "Done with creating user #{counter}"
  puts ""
  counter += 1
end
