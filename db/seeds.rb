# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# db/seeds.rb

ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Item.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
  
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    User.create!(
      name: 'Jake Farm', 
      email: 'jakefarm@gmail.com', 
      password: 'password'
    )
  
    # More users
    10.times do
      fake_name = Faker::Name::unique.name
      User.create!({
        name: fake_name,
        email: Faker::Internet.unique.email(name: fake_name),
        password: 'password'
      }) 
    end

    puts "Creating items..."

    Item.create!(
      name: 'Cougar',
      animal_type: 'Big Cat',
      price: 156000,
      description: 'The cougar is a large cat native to the Americas. Its range spans from the Canadian Yukon to the southern Andes in South America and is the most widespread of any large wild terrestrial mammal in the Western Hemisphere.'
    )

    Item.create!(
      name: 'Penguin',
      animal_type: 'Bird',
      price: 6750,
      description: "Penguins are a group of aquatic flightless birds. They live almost exclusively in the Southern Hemisphere: only one species, the Galápagos penguin, is found north of the Equator."
    )

    Item.create!(
      name: 'Komodo Dragon',
      animal_type: 'Reptile',
      price: 785000,
      description: "The Komodo dragon (Varanus komodoensis), also known as the Komodo monitor, is a member of the monitor lizard family Varanidae that is endemic to the Indonesian islands of Komodo, Rinca, Flores, and Gili Motang. It is the largest extant species of lizard, growing to a maximum length of 3 m (9.8 ft), and weighing up to 70 kg (150 lb)."
    )

    Item.create!(
      name: 'Yak',
      animal_type: 'Bovine',
      price: 4999,
      description: "The domestic yak (Bos grunniens), also known as the Tartary ox, grunting ox or hairy cattle, is a species of long-haired domesticated cattle found throughout the Himalayan region of the Indian subcontinent, the Tibetan Plateau, Gilgit-Baltistan (Kashmir), Tajikistan and as far north as Mongolia and Siberia."
    )
  
    puts "Done!"
  end