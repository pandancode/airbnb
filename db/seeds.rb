
# charmander = PokeApi.get(pokemon: 'charmander')

# Seeding users, SO guide and also documentation
# https://stackoverflow.com/questions/12418584/seeding-users-with-devise-in-ruby-on-rails
# https://guides.rubyonrails.org/security.html
# counter = 1

# puts "Cleaning user database"
# User.destroy_all
# puts "Cleaning user database: done"

# 3.times do
#   puts "Creating user #{counter}"
#   new_user = User.new
#   new_user.email = "test#{counter}@test.com"
#   # Don't use encrypted_password, this works
#   new_user.password = "111111"
#   new_user.first_name = "John#{counter}"
#   new_user.last_name = "Doe#{counter}"
#   new_user.phone_number = "0123467800#{counter}"

#   puts new_user.email
#   puts new_user.encrypted_password
#   puts "Is the user valid? #{new_user.valid?}"
#   new_user.save!
#   puts "Done with creating user #{counter}"
#   puts ""
#   counter += 1
# end


puts "Destroying all transactions"
Transaction.destroy_all
puts "Done destroying all pokemon"

puts "Destroying all pokemon"
Pokemon.destroy_all
puts "Done destroying all pokemon"

puts "Destroying all users"
User.destroy_all
puts "Done destroying all pokemon"

puts "Creating user 1 (Team Rocket) to sell seeded Pokemon"
  new_user = User.new
  new_user.email = "team@rocket.com"
  # Don't use encrypted_password, this works
  new_user.password = "111111"
  new_user.first_name = "Team"
  new_user.last_name = "Rocket"
  new_user.phone_number = "00000001"
  puts "Is the user valid? #{new_user.valid?}"
  new_user.save!
puts "Done creating user 1 (Team Rocket)"

# Create the below list only once
# num = 1
# 898.times do
#   puts "creating pkmn #{num}"
#   PokemonList.create(
#     name: PokeApi.get(pokemon: num).name.capitalize
#   )
#   num += 1
# end

counter = 1

10.times do
  puts "Start creating pokemon #{counter}"
  desc = ["My favorite shiny", "My first shiny", "Caught in London", "Caught in Paris", "Caught in Tokyo", "Caught in NYC", "Shiny available upon request"]
  # rand_pkmn = (1..151).to_a.sample
  Pokemon.create(
    level: 100,
    price: 10,
    description: desc.sample,
    # pokemon_name: rand_pkmn,
    pokemon_name: PokeApi.get(pokemon: (1..151).to_a.sample).name.capitalize,
    user_id: new_user.id
  )
  puts "Creation done"
  counter += 1
end
