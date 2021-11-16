
charmander = PokeApi.get(pokemon: 'charmander')

# Seeding users, SO guide and also documentation
# https://stackoverflow.com/questions/12418584/seeding-users-with-devise-in-ruby-on-rails
# https://guides.rubyonrails.org/security.html
counter = 1

puts "Cleaning user database"
User.destroy_all
puts "Cleaning user database: done"

20.times do
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

100.times do
  puts "Start"
  puts "Creating pokemon"

  Pokemon.create(
    level: 100,
    price: 10,
    pokemon_name: PokeApi.get(pokemon: (1..898).to_a.sample).name,
    user_id: (1..20).to_a.sample
  )
  puts "Creation done"
  # pkmn.save!
  puts "end"
end
