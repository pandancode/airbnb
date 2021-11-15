charmander = PokeApi.get(pokemon: 'charmander')

10.times do
  user = User.new(
    first_name: "Giorgio",
    last_name: "Chen",
    phone_number: "0712359545"
  )
  user.save!
end

10.times do
  puts "Start"

  num = 1
  pkmn = Pokemon.new(
    level: 100,
    price: 10,
    pokemon_name: PokeApi.get(pokemon: 'charmander').name,
    user_id: num
  )
  puts "Gonna save"
  pkmn.save!
  puts "end"
  num += 1
end

# GET NAME --> PokeApi.get(pokemon: 'bulbasaur').name
# GET IMAGE --> PokeApi.get(pokemon: 'bulbasaur').sprites.front_default
