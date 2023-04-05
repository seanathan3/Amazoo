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
      animal_type: 'Feline',
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

    Item.create!(
      name: 'Koala',
      animal_type: 'Marsupial',
      price: 87000,
      description: "The koala or, inaccurately, koala bear (Phascolarctos cinereus), is an arboreal herbivorous marsupial native to Australia. It is the only extant representative of the family Phascolarctidae and its closest living relatives are the wombats."
    )

    Item.create!(
      name: 'T-Rex',
      animal_type: 'Dinosaur',
      price: 2678450,
      description: "he species Tyrannosaurus rex (rex meaning 'king' in Latin), often called T. rex or colloquially T-Rex, is one of the best represented theropods. It lived throughout what is now western North America, on what was then an island continent known as Laramidia."
    )

    Item.create!(
      name: 'Jaguar',
      animal_type: 'Feline',
      price: 204000,
      description: "The jaguar (Panthera onca) is a large cat species and the only living member of the genus Panthera native to the Americas. With a body length of up to 1.85 m (6 ft 1 in) and a weight of up to 158 kg (348 lb), it is the largest cat species in the Americas and the third largest in the world." 
    )

    Item.create!(
      name: 'Fox',
      animal_type: 'Canine',
      price: 95680,
      description: "Foxes are small to medium-sized, omnivorous mammals belonging to several genera of the family Canidae. They have a flattened skull, upright, triangular ears, a pointed, slightly upturned snout, and a long bushy tail ('brush')."
    )

    Item.create!(
      name: 'Bald Eagle',
      animal_type: 'Bird',
      price: 50000,
      description: "The bald eagle (Haliaeetus leucocephalus) is a bird of prey found in North America. A sea eagle, it has two known subspecies and forms a species pair with the white-tailed eagle (Haliaeetus albicilla), which occupies the same niche as the bald eagle in the Palearctic."
    )

    Item.create!(
      name: "Kangaroo",
      animal_type: "Marsupial",
      price: 323700,
      description: "Kangaroos are four marsupials from the family Macropodidae (macropods, meaning 'large foot'). In common use the term is used to describe the largest species from this family, the red kangaroo, as well as the antilopine kangaroo, eastern grey kangaroo, and western grey kangaroo."
    )

    Item.create!(
      name: 'Wolf',
      animal_type: "Canine",
      price: 102000,
      description: "The wolf (Canis lupus;[b] pl: wolves), also known as the gray wolf or grey wolf, is a large canine native to Eurasia and North America. More than thirty subspecies of Canis lupus have been recognized, including the dog and dingo, though gray wolves, as popularly understood, only comprise naturally-occurring wild subspecies."
    )

    Item.create!(
      name: "Dung Beetle",
      animal_type: "Insect",
      price: 750,
      description: "Dung beetles are beetles that feed on feces. Some species of dung beetles can bury dung 250 times their own mass in one night. Many dung beetles, known as rollers, roll dung into round balls, which are used as a food source or breeding chambers."
    )

    Item.create!(
      name: "Leopard",
      animal_type: "Feline",
      price: 106000,
      description: "he leopard (Panthera pardus) is one of the five extant species in the genus Panthera, a member of the cat family, Felidae. It occurs in a wide range in sub-Saharan Africa, in some parts of Western and Central Asia, Southern Russia, and on the Indian subcontinent to Southeast and East Asia."
    )

    Item.create!(
      name: "Opossum",
      animal_type: "Marsupial",
      price: 32060,
      description: "Opossums are members of the marsupial order Didelphimorphia endemic to the Americas. The largest order of marsupials in the Western Hemisphere, it comprises 93 species in 18 genera. Opossums originated in South America and entered North America in the Great American Interchange following the connection of North and South America." 
    )

    Item.create!(
      name: "Orangutan",
      animal_type: "Ape",
      price: 206770,
      description: "Orangutans are great apes native to the rainforests of Indonesia and Malaysia. They are now found only in parts of Borneo and Sumatra, but during the Pleistocene they ranged throughout Southeast Asia and South China. Classified in the genus Pongo, orangutans were originally considered to be one species."
    )

    Item.create!(
      name: "Guinea Pig",
      animal_type: "Rodent",
      price: 4500,
      description: "The guinea pig or domestic guinea pig (Cavia porcellus), also known as the cavy or domestic cavy, is a species of rodent belonging to the genus Cavia in the family Caviidae. Breeders tend to use the word cavy to describe the animal, while in scientific and laboratory contexts, it is far more commonly referred to by the common name guinea pig."
    )

    Item.create!(
      name: "Capybara",
      animal_type: "Rodent",
      price: 10000000,
      description: "The capybara or greater capybara (Hydrochoerus hydrochaeris) is a giant cavy rodent native to South America. It is the largest living rodent and a member of the genus Hydrochoerus. The only other extant member is the lesser capybara (Hydrochoerus isthmius)."
    )

    Item.create!(
      name: "Velociraptor",
      animal_type: "Dinosaur",
      price: 1797000,
      description: "Velociraptor is a genus of small dromaeosaurid dinosaur that lived in Asia during the Late Cretaceous epoch, about 75 million to 71 million years ago. Two species are currently recognized, although others have been assigned in the past."
    )

    Item.create!(
      name: "Stegosaurus",
      animal_type: "Dinosaur",
      price: 2040600,
      description: "Stegosaurus is a genus of herbivorous, four-legged, armored dinosaur from the Late Jurassic, characterized by the distinctive kite-shaped upright plates along their backs and spikes on their tails. The remains of over 80 individual animals of this genus have been found."
    )

    Item.create!(
      name: "Pterodactyl",
      animal_type: "Dinosaur",
      price: 1994000,
      description: "Pterodactylus (from Greek pterodáktylos (πτεροδάκτυλος) meaning 'winged finger') is an extinct genus of pterosaurs. It is thought to contain only a single species, Pterodactylus antiquus, which was the first pterosaur to be named and identified as a flying reptile."
    )

    Item.create!(
      name: "Bull",
      animal_type: "Bovine",
      price: 143000,
      description: "A bull is an intact (i.e., not castrated) adult male of the species Bos taurus (Cow). More muscular and aggressive than the females of the same species (i.e., cows), bulls have long been an important symbol in many religions, including for sacrifices. These animals play a significant role in beef ranching."
    )

    Item.create!(
      name: "Water buffalo",
      animal_type: "Bovine",
      price: 167090,
      description: "The water buffalo (Bubalus bubalis), also called the domestic water buffalo or Asian water buffalo, is a large bovid originating in the Indian subcontinent and Southeast Asia. Today, it is also found in Europe, Australia, North America, South America and some African countries."
    )

    Item.create!(
      name: "Turtle",
      animal_type: "Reptile",
      price: 76040,
      description: "Turtles are an order of reptiles known as Testudines, characterized by a special shell developed mainly from their ribs. Modern turtles are divided into two major groups, the Pleurodira (side necked turtles) and Cryptodira (hidden necked turtles), which differ in the way the head retracts."
    )

    Item.create!(
      name: "Snake",
      animal_type: "Reptile",
      price: 67000,
      description: "Snakes are elongated, limbless, carnivorous reptiles of the suborder Serpentes. Like all other squamates, snakes are ectothermic, amniote vertebrates covered in overlapping scales."
    )

    Item.create!(
      name: "Chimpanzee",
      animal_type: "Ape",
      price: 136000,
      description: "The chimpanzee (Pan troglodytes), also known as simply the chimp, is a species of great ape native to the forest and savannah of tropical Africa. It has four confirmed subspecies and a fifth proposed subspecies."
    )

    Item.create!(
      name: "Baboon",
      animal_type: "Ape",
      price: 122900,
      description: "Baboons are primates comprising the genus Papio, one of the 23 genera of Old World monkeys, in the family Cercopithecidae. There are six species of baboon: the hamadryas baboon, the Guinea baboon, the olive baboon, the yellow baboon, the Kinda baboon and the chacma baboon. "
    )

    Item.create!(
      name: "Raven",
      animal_type: "Bird",
      price: 3200,
      description: "A raven is any of several larger-bodied passerine bird species in the genus Corvus. These species do not form a single taxonomic group within the genus. There is no consistent distinction between 'crows' and 'ravens', common names which are assigned to different species chiefly based on their size."
    )

    Item.create!(
      name: "Hamster",
      animal_type: "Rodent",
      price: 290,
      description: "Hamsters are rodents (order Rodentia) belonging to the subfamily Cricetinae, which contains 19 species classified in seven genera. They have become established as popular small pets. The best-known species of hamster is the golden or Syrian hamster."
    )
  
    puts "Done!"
  end