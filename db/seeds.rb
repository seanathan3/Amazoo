# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# db/seeds.rb

# ApplicationRecord.transaction do 

    require "open-uri"

    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    Review.destroy_all
    CartItem.destroy_all
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

    users_arr = []
  
    # More users
    10.times do
      fake_name = Faker::Name::unique.name
      users_arr.push(User.create!({
        name: fake_name,
        email: Faker::Internet.unique.email(name: fake_name),
        password: 'password'
      }))
    end

    puts "Creating items..."

    items_arr = []

    cougar = Item.create!(
      name: 'Cougar',
      animal_type: 'Feline',
      price: 156000,
      description: 'Cougars, also known as mountain lions, pumas, or panthers, are large cats that are native to the Americas.
      They have short, tawny fur and a long tail, and are adept at climbing trees.
      Cougars are solitary animals and are most active at dawn and dusk.
      They have a wide range of habitats, including forests, deserts, and mountains throughout North and South America.
      Cougars are ambush predators and stalk their prey, which includes deer, elk, and smaller animals such as rabbits and rodents.
      They have a reputation for being elusive and avoiding humans, but they may become more bold and aggressive if they feel threatened or cornered.
      Cougars are capable of jumping up to 18 feet (5.5 meters) in a single bound.
      They are listed as a species of "Least Concern" by the IUCN, although some populations are threatened by habitat loss, hunting, and other human activities.
      In some indigenous cultures, cougars are considered sacred and are associated with courage and strength.
      Cougars play an important role in maintaining healthy ecosystems by regulating the populations of their prey.'
    )


    penguin = Item.create!(
      name: 'Penguin',
      animal_type: 'Bird',
      price: 6750,
      description: "Penguins are a group of flightless birds that are highly adapted to life in the water.
      They are found exclusively in the Southern Hemisphere, ranging from Antarctica to the coasts of South America, Africa, Australia, and New Zealand.
      There are 18 species of penguins, each with its own unique characteristics and distribution.
      Penguins have a streamlined body shape and waterproof feathers that help them to swim and stay warm in cold water.
      They are social animals and live in large colonies, with some colonies containing hundreds of thousands of birds.
      Penguins are carnivores and primarily feed on krill, squid, and fish.
      They have several adaptations for living in cold environments, including a thick layer of blubber and a heat-exchange system that helps them to conserve body heat.
      Penguins have excellent vision both in and out of water, which helps them to locate prey and navigate through their environment.
      Many penguin species have distinctive calls that help individuals recognize each other and locate their mates and chicks in crowded colonies.
      Penguins are popular symbols of resilience, perseverance, and community, and are beloved by people around the world."
    )



    komodo_dragon = Item.create!(
      name: 'Komodo Dragon',
      animal_type: 'Reptile',
      price: 785000,
      description: "Komodo dragons are the largest living lizards and are found only on a few islands in Indonesia.
      They can grow up to 10 feet (3 meters) long and weigh over 150 pounds (70 kg).
      Komodo dragons have a tough, scaly skin that provides protection from predators and helps to retain moisture.
      They are powerful hunters and primarily prey on deer, wild pigs, and water buffalo.
      Komodo dragons have a venomous bite that can cause rapid blood loss and shock in their prey.
      They have a keen sense of smell and can detect carrion from up to 5 miles (8 km) away.
      Komodo dragons are capable of reproducing through parthenogenesis, a process in which females can produce offspring without mating with a male.
      They are considered a vulnerable species by the IUCN due to habitat loss, hunting, and poaching.
      Komodo dragons play an important role in their ecosystem as apex predators, regulating the populations of their prey and scavenging on carrion.
      They are a popular tourist attraction in Indonesia, and several protected areas have been established to help conserve their populations."
    )



    yak = Item.create!(
      name: 'Yak',
      animal_type: 'Bovine',
      price: 4999,
      description: "Yaks are large, shaggy-haired mammals that are native to the Himalayan region of Central Asia.
      They are domesticated animals and have been used for transportation, meat, milk, and wool by people in the region for thousands of years.
      Yaks are well adapted to living in high altitudes and can survive in extremely cold temperatures.
      They have a thick, woolly coat that provides insulation from the cold and protection from the sun.
      Yaks have a strong sense of smell and are able to detect predators from a distance.
      They are herbivores and primarily feed on grasses, herbs, and lichens.
      Yaks have a docile temperament and are well-suited to living in harsh, remote environments.
      They are social animals and live in herds, typically consisting of females and their young.
      Yaks are culturally significant to the people of the Himalayan region, and are often used in religious ceremonies and festivals.
      There are two main types of yaks: the domestic yak and the wild yak, which is a critically endangered species."
    )

    koala = Item.create!(
      name: 'Koala',
      animal_type: 'Marsupial',
      price: 87000,
      description: "Koalas are native to Australia and are known for their fluffy ears, round noses, and adorable appearance.
      They are marsupials, which means that their young are born in an undeveloped state and continue to develop outside the womb in a pouch.
      Koalas have a specialized diet of eucalyptus leaves, which are toxic to most other animals.
      They are arboreal animals and spend most of their time in trees, where they sleep and eat.
      Koalas have a unique digestive system that allows them to break down the tough eucalyptus leaves and extract nutrients from them.
      They are social animals and live in groups, although they are mostly solitary within their home ranges.
      Koalas have a low metabolic rate and sleep for up to 20 hours a day, conserving energy between meals.
      They have sharp claws and strong limbs that help them to climb trees and move between branches.
      Koalas are considered a vulnerable species by the IUCN due to habitat loss, disease, and other threats.
      They are a beloved symbol of Australia and are popular with tourists and locals alike."
    )

    t_rex = Item.create!(
      name: 'T-Rex',
      animal_type: 'Dinosaur',
      price: 2678450,
      description: "T-rex was one of the largest meat-eating dinosaurs that ever lived, measuring up to 40 feet (12 meters) long and weighing up to 9 tons (8 metric tons).
      It lived during the Late Cretaceous period, around 68 to 66 million years ago, in what is now North America.
      T-rex had a massive head with powerful jaws and sharp, serrated teeth that could crush bone and tear flesh.
      It had small, two-fingered forelimbs that were probably used for grasping and holding onto prey.
      T-rex had a long, heavy tail that could be used for balance and counterbalance during fast movements.
      It was a bipedal animal, walking on two powerful hind legs that were capable of moving quickly and covering large distances.
      T-rex was likely an apex predator, at the top of the food chain in its ecosystem.
      It is believed to have had excellent vision and sense of smell, which would have helped it locate prey and navigate its environment.
      T-rex had a unique bone structure in its skull that helped to absorb shock and prevent brain damage during head-on collisions with prey.
      Despite its fearsome reputation, T-rex was probably a scavenger as well as a predator, and may have relied on carrion as a source of food during times of scarcity."
    )

    jaguar = Item.create!(
      name: 'Jaguar',
      animal_type: 'Feline',
      price: 204000,
      description: "Jaguars are the largest cats in the Americas and the third largest in the world.
      Their coat of fur is typically yellow or orange with black spots arranged in a circular pattern.
      Jaguars are skilled swimmers and often hunt prey in the water, such as fish, turtles, and caimans.
      They have powerful jaws and can crush the skull of their prey with a single bite.
      Jaguars are solitary animals and do not form prides like lions or tigers.
      They are found in a range of habitats, including rainforests, grasslands, and swamps throughout Central and South America.
      The jaguar is the national animal of Brazil.
      Jaguars are listed as 'Near Threatened' by the IUCN due to habitat loss, hunting, and conflict with humans.
      Some indigenous cultures view jaguars as powerful spiritual beings associated with strength and protection.
      Jaguars play a crucial role in maintaining healthy ecosystems by regulating the populations of their prey." 
    )

    fox = Item.create!(
      name: 'Fox',
      animal_type: 'Canine',
      price: 95680,
      description: "Foxes are members of the Canidae family, which includes dogs, wolves, and coyotes.
      There are around 37 different species of foxes, found all over the world, in a variety of different habitats.
      Foxes are known for their distinctive pointed ears, long snouts, and bushy tails, which they use for balance and communication.
      They are omnivores, and their diet can include small mammals, birds, insects, fruits, and other plant material.
      Foxes are typically solitary animals, although they may form pairs during the breeding season.
      They are adaptable animals and are able to thrive in a variety of different environments, from urban areas to forests and deserts.
      Foxes are well-known for their intelligence and have been known to use problem-solving skills to obtain food and other resources.
      They have excellent senses, including keen eyesight, hearing, and sense of smell, which they use to locate prey and navigate their environment.
      Foxes play an important role in many ecosystems, controlling the populations of small mammals and insects.
      Foxes have been depicted in mythology and folklore in many different cultures, and are often associated with cleverness, trickery, and cunning."
    )

    bald_eagle = Item.create!(
      name: 'Bald Eagle',
      animal_type: 'Bird',
      price: 50000,
      description: "Bald eagles are large birds of prey that live in North America and are known for their distinctive white heads and tails.
      They are not actually bald, but rather their name comes from the old English word 'balde,' which means white-headed.
      Bald eagles are the national bird and symbol of the United States, appearing on the Great Seal and other national emblems.
      They are powerful flyers and can reach speeds of up to 50 miles per hour (80 km/h) when diving or swooping in to catch prey.
      Bald eagles are opportunistic hunters and scavengers, feeding on fish, birds, small mammals, and carrion.
      They mate for life and build large nests high up in trees or on cliffs, which they may use for many years.
      Bald eagles are a conservation success story, having been listed as an endangered species in the United States in 1967, but making a remarkable recovery and being removed from the endangered list in 2007.
      They have an average lifespan of 20-30 years in the wild, but have been known to live up to 50 years in captivity.
      Bald eagles have remarkable eyesight, which is estimated to be four times sharper than that of a human.
      They are important indicators of ecosystem health, and their presence in a habitat is often a sign of a healthy, functioning ecosystem."
    )

    kangaroo = Item.create!(
      name: "Kangaroo",
      animal_type: "Marsupial",
      price: 323700,
      description: "Kangaroos are marsupials that are native to Australia and are well-known for their powerful hind legs and unique hopping gait.
      They are the largest marsupials in the world, with the red kangaroo species growing up to 6 feet (1.8 meters) tall and weighing up to 200 pounds (90 kilograms).
      Kangaroos are herbivores, and their diet consists mainly of grasses, leaves, and other vegetation.
      They are social animals and are often found in groups called mobs, troops, or courts.
      Kangaroos are able to hop at high speeds of up to 40 miles per hour (64 km/h) and can cover distances of over 25 feet (7.6 meters) in a single hop.
      They have a unique reproductive system, with females carrying their young in a pouch for up to 8 months after birth.
      Male kangaroos are known for their boxing matches, which they use to establish dominance and compete for mates.
      Kangaroos are an important part of Australian culture and are often used as symbols of the country.
      They are also an important part of the ecosystem in which they live, playing a role in shaping the landscape and controlling plant growth.
      Kangaroos are able to conserve water and energy by reducing their metabolic rate during periods of drought or food scarcity."
    )

    wolf = Item.create!(
      name: 'Wolf',
      animal_type: "Canine",
      price: 102000,
      description: "Wolves are a species of large, carnivorous mammals that are part of the Canidae family, which also includes dogs, coyotes, and foxes.
      There are many different subspecies of wolves, which can be found in a variety of habitats around the world, from tundras to deserts to forests.
      Wolves are social animals and live in packs, which are led by an alpha male and female.
      They are apex predators and play an important role in maintaining the balance of ecosystems they live in by controlling the populations of prey species.
      Wolves are known for their distinctive howl, which is used for communication within the pack and to establish territorial boundaries.
      They have powerful jaws and sharp teeth that they use to catch and kill their prey.
      Wolves have an incredible sense of smell, which they use to locate prey, navigate their environment, and communicate with other members of the pack.
      They are capable of running at speeds of up to 40 miles per hour (64 km/h) and can cover long distances in pursuit of their prey.
      Wolves have a complex social hierarchy within their packs, and are known for their loyalty and close bonds with other members of the group.
      Wolves have been the subject of many myths and legends throughout human history, and are often depicted as symbols of power, loyalty, and strength."
    )

    dung_beetle = Item.create!(
      name: "Dung Beetle",
      animal_type: "Insect",
      price: 750,
      description: "Dung beetles are a family of beetles that are known for their habit of feeding on and rolling animal dung.
      They play an important role in many ecosystems by helping to break down and recycle animal waste, which helps to fertilize the soil and reduce the spread of disease.
      There are over 8,000 species of dung beetles found throughout the world, and they come in a variety of sizes and colors.
      Dung beetles have a strong sense of smell, which they use to locate animal waste from a distance.
      They are able to roll balls of dung that are many times their own body weight, using their front legs to steer and their back legs to push the ball along.
      Some species of dung beetles also use the balls of dung as a source of food for their offspring, burying the balls in underground tunnels for later use.
      Dung beetles are important to agriculture, as they help to improve soil quality and reduce the amount of pest insects in the environment.
      They are also used in some cultures as a symbol of good luck and fertility.
      Dung beetles are a keystone species in many ecosystems, meaning that they play a vital role in maintaining the balance and health of the environment they live in.
      They have a unique and fascinating set of behaviors and adaptations that make them an important and fascinating part of the natural world."
    )

    leopard = Item.create!(
      name: "Leopard",
      animal_type: "Feline",
      price: 106000,
      description: "Leopards are a large, carnivorous cat species found throughout much of Africa and Asia.
      They are known for their distinctive coat, which is covered in spots that help them to blend in with their surroundings.
      Leopards are powerful hunters and can take down prey much larger than themselves, including antelope, deer, and even young giraffes.
      They are also capable of climbing trees and dragging their prey up with them to protect it from other predators.
      Leopards are solitary animals and only come together to mate or raise young.
      They are excellent swimmers and are able to cross rivers and swim long distances to reach new hunting grounds.
      Leopards are able to live in a variety of habitats, including forests, deserts, and grasslands.
      They are classified as a vulnerable species due to habitat loss, poaching, and hunting for their fur.
      Leopards have a unique vocalization that sounds like a rasping cough, which they use to communicate with other leopards in the area.
      They are a symbol of strength and agility in many cultures, and have been depicted in art and literature for centuries."
    )

    opossum = Item.create!(
      name: "Opossum",
      animal_type: "Marsupial",
      price: 32060,
      description: "Opossums are a marsupial species native to North and South America.
      They are known for their distinctive appearance, which includes a long, pointed snout, sharp teeth, and a prehensile tail.
      Opossums are nocturnal animals, meaning that they are most active at night.
      They are opportunistic feeders and will eat almost anything, including insects, small animals, fruit, and garbage.
      Opossums are often considered a nuisance species, as they are known for raiding trash cans and causing damage to gardens and crops.
      They are the only marsupial species found in North America.
      Opossums have a unique defense mechanism where they will play dead when threatened, which can make predators lose interest and leave them alone.
      They have a low body temperature compared to other mammals, which makes them less susceptible to diseases like rabies.
      Opossums have a lifespan of up to 4 years in the wild, but can live up to 8 years in captivity.
      They are considered to be important species in their ecosystem, as they help to control the populations of insects and other small animals." 
    )

    orangutan = Item.create!(
      name: "Orangutan",
      animal_type: "Ape",
      price: 206770,
      description: "Orangutans are one of the three great ape species, along with chimpanzees and gorillas.
      They are native to the rainforests of Indonesia and Malaysia on the islands of Borneo and Sumatra.
      Orangutans are arboreal animals, spending most of their lives in trees.
      They are known for their distinctive reddish-brown hair and long, powerful arms that help them to move through the trees.
      Orangutans are highly intelligent animals, capable of using tools and showing self-awareness.
      They are a solitary species, with males and females only coming together to mate.
      Orangutans are classified as critically endangered due to habitat loss, poaching, and hunting.
      They have a lifespan of up to 40 years in the wild and up to 60 years in captivity.
      Orangutans have a specialized diet that includes a variety of fruits, leaves, and insects.
      They are considered to be a keystone species in their ecosystem, helping to disperse seeds and maintain the health of the rainforest."
    )

    guinea_pig = Item.create!(
      name: "Guinea Pig",
      animal_type: "Rodent",
      price: 4500,
      description: "Guinea pigs, also known as cavies, are small domesticated rodents native to South America.
      They are social animals and prefer to live in groups or pairs.
      Guinea pigs have a lifespan of 5-7 years, but can live up to 8 years with proper care.
      They are popular pets due to their friendly and social nature, as well as their cute and cuddly appearance.
      Guinea pigs are herbivores, and their diet should consist mainly of hay, fresh vegetables, and pellets.
      They have poor eyesight but an excellent sense of smell and hearing.
      Guinea pigs are prone to a number of health problems, including respiratory infections and dental issues, so it's important to provide them with proper care and veterinary checkups.
      They are vocal animals and will make a variety of noises to communicate with their owners and each other.
      Guinea pigs are often used in research studies due to their docile nature and ease of handling.
      They have a unique ability to synthesize their own vitamin C, but still require a vitamin C-rich diet to maintain optimal health."
    )

    capybara = Item.create!(
      name: "Capybara",
      animal_type: "Rodent",
      price: 10000000,
      description: "Capybaras are the largest rodents in the world, weighing up to 140 pounds.
      They are semi-aquatic animals and are native to South America, where they live near water sources like rivers and swamps.
      Capybaras are social animals and live in groups of up to 20 individuals, led by a dominant male.
      They are herbivores and mainly feed on grasses, aquatic plants, and fruits.
      Capybaras have partially webbed feet, which allow them to swim and dive in water.
      They are often hunted for their meat and hide, and their habitats are threatened by deforestation and human encroachment.
      Capybaras have a lifespan of around 8-10 years in the wild and up to 12 years in captivity.
      They communicate with each other through a variety of sounds, including barks, whistles, and purrs.
      Capybaras are sometimes kept as pets, but they require a lot of space and care due to their size and social nature.
      They have been observed engaging in mutual grooming and even sharing food with other animals, including birds and monkeys."
    )

    velociraptor = Item.create!(
      name: "Velociraptor",
      animal_type: "Dinosaur",
      price: 1797000,
      description: "Velociraptors were a type of small, carnivorous dinosaur that lived during the Late Cretaceous Period, around 75-71 million years ago.
      They were about the size of a turkey, with a height of around 2 feet and a length of up to 7 feet.
      Velociraptors had sharp, curved claws on their feet, which they used for grasping and slashing their prey.
      They were highly intelligent and social animals, and likely hunted in packs to take down larger prey.
      Velociraptors had a bird-like appearance, with feathers covering their bodies and long, stiff tails used for balance.
      Contrary to their depiction in popular media, velociraptors were not much larger than common chickens and did not have the ability to speak.
      They were fast runners, with estimated speeds of up to 40 miles per hour.
      Velociraptors were discovered in the Gobi Desert in Mongolia in the early 1900s by American paleontologist Roy Chapman Andrews.
      They had sharp teeth and a powerful bite, which they used to puncture and tear through flesh.
      The name 'velociraptor' means 'swift thief' in Latin, reflecting their speed and predatory behavior."
    )

    stegosaurus = Item.create!(
      name: "Stegosaurus",
      animal_type: "Dinosaur",
      price: 2040600,
      description: "Stegosaurs were a group of herbivorous dinosaurs that lived during the Jurassic period, about 150 million years ago.
      They were characterized by their large, bony plates that ran down their backs and tails, as well as their distinctive spiked tails.
      The plates on the stegosaur's back may have served a number of purposes, including regulating body temperature, protecting against predators, or as a display feature to attract mates.
      Stegosaurs were relatively large animals, reaching lengths of up to 30 feet and weighing over 5,000 pounds.
      They had a small head and a beak-like mouth, which they used to crop vegetation.
      Stegosaurs had a low center of gravity and were quadrupedal, meaning that they walked on all four legs.
      The spines on the stegosaur's tail, known as thagomizers, were likely used as a defense against predators like Allosaurs and Ceratosaurs.
      Stegosaurs were herbivores and primarily ate low-lying vegetation like ferns, horsetails, and cycads.
      Fossil evidence suggests that Stegosaurs had a relatively slow metabolism and may have been active during the day or at dawn and dusk.
      Stegosaurs were one of the most recognizable groups of dinosaurs and have become a popular subject in popular culture and media."
    )

    pterodactyl = Item.create!(
      name: "Pterodactyl",
      animal_type: "Dinosaur",
      price: 1994000,
      description: "Pterodactyls were a type of flying reptile that lived during the Late Jurassic and Early Cretaceous periods, about 145-65 million years ago.
      They were not actually dinosaurs, but belong to a group of reptiles called pterosaurs.
      Pterodactyls had a wingspan of up to 33 feet, making them one of the largest flying animals of all time.
      Their wings were formed by a membrane of skin and muscle that stretched from their elongated fourth finger to their ankles.
      Pterodactyls had sharp, pointed beaks and teeth, which they used to catch fish and other small prey while in flight.
      Some species of pterodactyls had elaborate head crests, which were likely used for display or to attract mates.
      Pterodactyls were capable of launching themselves into the air by running on all fours and flapping their wings until they achieved lift.
      They were able to fly at high altitudes, and some species may have been able to travel long distances in search of food.
      Pterodactyls are often depicted in popular media as being able to breathe fire or possess other fantastical abilities, but in reality they were simply flying reptiles with no supernatural powers.
      Fossil evidence suggests that pterodactyls went extinct along with the dinosaurs at the end of the Cretaceous period, about 65 million years ago."
    )

    bull = Item.create!(
      name: "Bull",
      animal_type: "Bovine",
      price: 143000,
      description: "Bulls are male cattle, which are domesticated animals that have been bred for agricultural purposes for thousands of years.
      They are typically larger and more muscular than cows, which are female cattle.
      Bulls are often used for breeding purposes, as they can impregnate many cows in a single breeding season.
      They are also raised for their meat, hides, and other byproducts such as gelatin and leather.
      Bulls are known for their aggressive behavior, which can be triggered by a variety of factors including territoriality, competition for mates, or feeling threatened.
      They are often used in bullfighting events in Spain and other parts of the world, where they are provoked and taunted by human performers.
      In some cultures, bulls are revered as sacred animals and are used in religious ceremonies and rituals.
      Bulls have excellent senses of hearing and smell, which they use to detect potential threats or mating opportunities.
      They are capable of running at speeds of up to 30 miles per hour, making them powerful and formidable animals.
      Despite their reputation for aggression, bulls can be trained and tamed by skilled handlers, and can even form strong bonds with humans if treated with respect and care."
    )

    water_buffalo = Item.create!(
      name: "Water buffalo",
      animal_type: "Bovine",
      price: 167090,
      description: "Water buffaloes are large domesticated animals that are primarily raised for their milk, meat, and hides.
      They are native to Southeast Asia, but have been introduced to other parts of the world including Africa, Europe, and South America.
      Water buffaloes are highly adaptable and can thrive in a variety of climates, from humid rainforests to arid deserts.
      They are well-known for their large, curved horns, which can grow up to 5 feet in length.
      Water buffaloes are strong swimmers and are often found in rivers, lakes, and other bodies of water.
      They are herbivores and feed on grasses, leaves, and other vegetation.
      Water buffaloes have a reputation for being stubborn and difficult to work with, but can be trained and tamed by skilled handlers.
      They are highly valued in many cultures for their milk, which is used to make a variety of dairy products including cheese, butter, and yogurt.
      Water buffaloes are also used as draft animals, and are often used to plow fields or transport heavy loads.
      Despite their name, water buffaloes are not closely related to African or American buffaloes, but are more closely related to domestic cattle."
    )

    turtle = Item.create!(
      name: "Turtle",
      animal_type: "Reptile",
      price: 76040,
      description: "Turtles are reptiles with a protective shell that encases their body and limbs.
      There are over 300 species of turtles that live on land, in freshwater, or in the ocean.
      Turtles are ectothermic, meaning they rely on their environment to regulate their body temperature.
      They have a slow metabolism and can live for several decades or even up to a century.
      Turtles are known for their long lifespans and are often kept as pets, although many species are protected and should not be kept in captivity.
      They have a unique ability to retract their head, tail, and limbs into their shell for protection.
      Turtles have excellent underwater vision and can hold their breath for extended periods of time while swimming.
      They are omnivores, feeding on a variety of foods including plants, insects, and small animals.
      Female turtles lay their eggs on land, often returning to the same nesting site year after year.
      Turtles are important in many cultures and are often featured in art and folklore as symbols of longevity, wisdom, and perseverance."
    )

    snake = Item.create!(
      name: "Snake",
      animal_type: "Reptile",
      price: 67000,
      description: "Snakes are elongated, legless reptiles that are found on every continent except Antarctica.
      They come in a variety of sizes, with the smallest snake measuring less than 4 inches (10 cm) and the largest measuring over 30 feet (9 meters).
      Snakes are carnivores and feed on a variety of prey, including insects, rodents, birds, and other snakes.
      They have a unique method of eating, in which they swallow their prey whole and then slowly digest it over time.
      Snakes have no eyelids, but instead have a clear scale over their eyes that protects them while allowing them to see.
      They are known for their ability to shed their skin, which they do periodically as they grow.
      Some species of snakes are venomous, and can use their venom to immobilize or kill their prey.
      Snakes are important predators in many ecosystems and can help to control populations of other animals.
      They are able to sense their surroundings through a variety of methods, including their vision, sense of smell, and ability to detect vibrations.
      Snakes are often feared and misunderstood, but are important and fascinating animals that play an important role in the natural world."
    )

    chimpanzee = Item.create!(
      name: "Chimpanzee",
      animal_type: "Ape",
      price: 136000,
      description: "Chimpanzees are one of the closest living relatives to humans, sharing around 98% of our DNA.
      They are native to Africa, and live in a variety of habitats, including forests, savannas, and mountains.
      Chimpanzees are highly intelligent and have been observed using tools, such as sticks to extract insects from tree bark or rocks to crack open nuts.
      They are social animals, living in communities that can range from a few individuals to over 100.
      Chimpanzees communicate with each other through a variety of methods, including vocalizations, gestures, and facial expressions.
      They are omnivores and feed on a variety of foods, including fruit, leaves, insects, and occasionally small animals.
      Chimpanzees have been observed engaging in a wide range of behaviors, including playing, grooming, and hunting.
      They are capable of recognizing themselves in mirrors, which is a trait that is shared by few other animals.
      Chimpanzees are threatened by habitat loss, hunting, and disease, and are considered an endangered species.
      They are studied extensively by researchers to better understand their behavior and to help with conservation efforts."
    )

    baboon = Item.create!(
      name: "Baboon",
      animal_type: "Ape",
      price: 122900,
      description: "Baboons are medium to large sized primates that are found in various parts of Africa and are closely related to Old World monkeys.
      There are five species of baboons: the chacma, the Guinea, the yellow, the olive, and the hamadryas baboon.
      Baboons are social animals that live in large groups called troops, which can have up to 200 individuals.
      They have a complex social structure that includes dominance hierarchies and various forms of communication, including vocalizations and body language.
      Baboons are omnivorous and feed on a variety of foods, including fruit, insects, small mammals, and even birds and reptiles.
      They are known for their powerful jaws and teeth, which they use for defense against predators and in disputes with other baboons.
      Baboons are known to have a lifespan of around 30 years in the wild.
      They are capable of adapting to a wide range of environments, from forests to grasslands, and can even thrive in urban areas.
      Baboons have been observed using tools, such as rocks to crack open nuts or sticks to probe for insects.
      They are threatened by habitat loss, hunting, and disease, and are considered a vulnerable species. "
    )

    raven = Item.create!(
      name: "Raven",
      animal_type: "Bird",
      price: 3200,
      description: "Ravens are large, black birds that are part of the crow family, known as Corvidae.
      There are several species of ravens, but the most common is the common raven, which is found throughout the northern hemisphere.
      Ravens are highly intelligent birds, known for their problem-solving abilities and their ability to use tools.
      They have a complex social structure and communicate with each other using a variety of vocalizations, including calls, clicks, and whistles.
      Ravens are omnivorous and feed on a variety of foods, including insects, small mammals, carrion, and even other birds' eggs and nestlings.
      They have a lifespan of up to 15 years in the wild, and even longer in captivity.
      Ravens are known for their playful behavior, and have been observed sliding down snow-covered roofs and playing games with other ravens.
      They are also known for their role in mythology and folklore, often being associated with death and magic.
      Ravens are monogamous and form lifelong bonds with their mates.
      They are considered to be one of the most intelligent birds, with the ability to recognize faces and solve puzzles that require planning and foresight."
    )

    hamster = Item.create!(
      name: "Hamster",
      animal_type: "Rodent",
      price: 290,
      description: "Hamsters are small rodents that are popular pets, known for their cute and cuddly appearance.
      There are several species of hamsters, but the most common is the Syrian or Golden hamster, which is native to the Middle East.
      They have a lifespan of around 2-3 years in captivity.
      Hamsters are nocturnal animals and are most active during the night.
      They are natural burrowers and in the wild, they live in underground burrows that they dig themselves.
      Hamsters are omnivorous and eat a variety of foods, including seeds, fruits, vegetables, and insects.
      They have cheek pouches that they use to store food, which allows them to gather and store food quickly.
      Hamsters are social animals but can become aggressive towards each other if kept in groups, so they are often kept alone as pets.
      They are known for their ability to run on wheels and enjoy playing and exploring their environment.
      Hamsters are also popular subjects for scientific research, especially in studies related to genetics and behavior."
    )

    orangutan.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/orangutan.png"),
      filename: "orangutan.png"
    )

    cougar.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/cougar.png"),
      filename: "cougar.png"
    )

    penguin.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/penguin.png"),
      filename: "penguin.png"
    )

    komodo_dragon.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/komodo_dragon.png"),
      filename: "komodo_dragon.png"
    )

    yak.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/yak.png"),
      filename: "yak.png"
    )

    koala.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/koala.png"),
      filename: "koala.png"
    )

    t_rex.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/t_rex.png"),
      filename: "t_rex.png"
    )

    jaguar.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/jaguar.png"),
      filename: "jaguar.png"
    )

    fox.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/fox.png"),
      filename: "fox.png"
    )

    bald_eagle.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/bald_eagle.png"),
      filename: "bald_eagle.png"
    )

    kangaroo.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/kangaroo.png"),
      filename: "kangaroo.png"
    )

    wolf.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/wolf.png"),
      filename: "wolf.png"
    )

    dung_beetle.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/dung_beetle.png"),
      filename: "dung_beetle.png"
    )

    leopard.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/leopard.png"),
      filename: "leopard.png"
    )

    opossum.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/opossum.png"),
      filename: "opossum.png"
    )

    guinea_pig.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/guinea_pig.png"),
      filename: "guinea_pig.png"
    )

    capybara.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/capybara.png"),
      filename: "capybara.png"
    )

    velociraptor.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/velociraptor.png"),
      filename: "velociraptor.png"
    )

    stegosaurus.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/stegosaurus.png"),
      filename: "stegosaurus.png"
    )

    pterodactyl.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/pterodactyl.png"),
      filename: "pterodactyl.png"
    )

    bull.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/bull.png"),
      filename: "bull.png"
    )

    water_buffalo.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/water_buffalo.png"),
      filename: "water_buffalo.png"
    )

    turtle.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/turtle.png"),
      filename: "turtle.png"
    )

    snake.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/snake.png"),
      filename: "snake.png"
    )

    chimpanzee.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/chimpanzee.png"),
      filename: "chimpanzee.png"
    )

    baboon.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/baboon.png"),
      filename: "baboon.png"
    )

    raven.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/raven.png"),
      filename: "raven.png"
    )

    hamster.photo.attach(
      io: URI.open("https://amazoo-seeds.s3.amazonaws.com/hamster.png"),
      filename: "hamster.png"
    )

    items_arr << cougar
    items_arr << orangutan
    items_arr << penguin
    items_arr << komodo_dragon
    items_arr << yak
    items_arr << koala
    items_arr << t_rex
    items_arr << jaguar
    items_arr << fox
    items_arr << bald_eagle
    items_arr << kangaroo
    items_arr << wolf
    items_arr << dung_beetle
    items_arr << leopard
    items_arr << opossum
    items_arr << guinea_pig
    items_arr << capybara
    items_arr << velociraptor
    items_arr << stegosaurus
    items_arr << pterodactyl
    items_arr << bull
    items_arr << water_buffalo
    items_arr << turtle
    items_arr << snake
    items_arr << chimpanzee
    items_arr << raven
    items_arr << hamster
    items_arr << baboon


    puts "Creating reviews..."

    Review.create!(
      rating: 3,
      title: "Interesting experience with the penguin",
      body: "I spent an afternoon with the penguin and it was an experience like no other. Watching them waddle around and dive into the water was so interesting. Their feathers were so soft and fluffy to the touch. I even got to feed them fish! All in all, it was an enjoyable experience, though I wish there were more penguins to see.",
      commenter_id: users_arr[3][:id],
      item_id: penguin[:id]
    )

    Review.create!(
      rating: 5,
      title: "My jaguar is a fierce and loyal companion",
      body: "I never thought I would own a jaguar, but now I couldn't imagine my life without her. She's incredibly loyal and always by my side, and her fierce and protective nature gives me a sense of security. She's also very intelligent and loves to play. If you're considering a jaguar as a pet, I highly recommend it!",
      commenter_id: users_arr[9][:id],
      item_id: jaguar[:id]
      )

      Review.create!(
      rating: 4,
      title: "My fox is a playful and entertaining pet",
      body: "My pet fox is one of the most entertaining pets I've ever owned. She's incredibly playful and loves to run and jump around the yard, and she always finds a way to make me laugh. She's also very intelligent and loves to learn new tricks. If you're looking for a fun and entertaining pet, a fox is a great choice!",
      commenter_id: users_arr[2][:id],
      item_id: fox[:id]
      )

      Review.create!(
      rating: 3,
      title: "My orangutan is a fascinating but challenging pet",
      body: "I love my pet orangutan, but I have to admit she can be a bit challenging at times. She's incredibly intelligent and loves to learn, but she can also be mischievous and sometimes gets into things she shouldn't. However, she's also incredibly fascinating to watch and has a unique personality that makes her a truly special pet.",
      commenter_id: users_arr[6][:id],
      item_id: orangutan[:id]
      )

      Review.create!(
      rating: 5,
      title: "My capybara is a gentle and affectionate pet",
      body: "My pet capybara is one of the sweetest and most affectionate pets I've ever owned. She loves to cuddle and be around people, and her gentle nature makes her a joy to be around. Plus, she's great with other pets and gets along well with my dogs and cats. If you're looking for a gentle and loving pet, a capybara is a great choice!",
      commenter_id: users_arr[8][:id],
      item_id: capybara[:id]
      )

      Review.create!(
      rating: 4,
      title: "My stegosaurus is a unique and fascinating pet",
      body: "Owning a pet stegosaurus is definitely not for everyone, but for me it's been a truly unique and fascinating experience. He's incredibly docile and friendly, and loves to be around people. Plus, his spiky back and long tail make him a truly impressive sight. If you're looking for a truly one-of-a-kind pet, a stegosaurus is a great choice!",
      commenter_id: users_arr[3][:id],
      item_id: stegosaurus[:id]
      )

      Review.create!(
      rating: 4,
      title: "The Best Turtle Ever!",
      body: "I never thought that owning a turtle would be so rewarding. Our pet turtle is such a delight to have around. She has a quirky personality and loves to swim around in her tank. We love watching her swim and interact with her surroundings. She is very low maintenance and has become a beloved member of our family.",
      commenter_id: users_arr[3][:id],
      item_id: turtle[:id]
      )

      Review.create!(
      rating: 5,
      title: "My Koala is a Bundle of Joy!",
      body: "I have always been fascinated by koalas and finally decided to adopt one as a pet. It was the best decision I ever made! My koala is such a lovable and adorable pet. She has a gentle demeanor and loves to cuddle. I love spending time with her and taking care of her needs. She has brought so much joy into my life.",
      commenter_id: users_arr[2][:id],
      item_id: koala[:id]
      )

      Review.create!(
      rating: 3,
      title: "Disappointing Experience with My Orangutan",
      body: "I had high hopes for owning an orangutan as a pet, but unfortunately, it has not been the positive experience I was hoping for. My pet orangutan is very strong-willed and can be difficult to manage. She has also caused damage to my home and furniture. While she can be affectionate at times, I would not recommend an orangutan as a pet unless you have extensive experience with primates.",
      commenter_id: users_arr[1][:id],
      item_id: orangutan[:id]
      )

      Review.create!(
      rating: 4,
      title: "My Fox is a Clever and Playful Companion",
      body: "I always wanted a fox as a pet, and I finally got one! My fox is a clever and playful companion who loves to play hide and seek with me. She is also very intelligent and has learned many tricks. Taking care of her has been a lot of work, but it's all been worth it for the joy she brings me.",
      commenter_id: users_arr[4][:id],
      item_id: fox[:id]
      )

      Review.create!(
      rating: 5,
      title: "My Jaguar is a Majestic and Graceful Creature",
      body: "I adopted a jaguar as a pet and have been amazed by her majestic and graceful nature. She is very intelligent and is a joy to watch as she moves about her space. She loves to play and is very affectionate towards me. Owning a jaguar is not for everyone, but for me, it has been an incredible experience.",
      commenter_id: users_arr[2][:id],
      item_id: jaguar[:id]
      )

      Review.create!(
      rating: 4,
      title: "My pet orangutan is incredibly intelligent",
      body: "I've always been fascinated by the intelligence of orangutans, and now that I have one as a pet, I can truly appreciate their incredible abilities. She's able to solve complex puzzles and even communicate with me through sign language. Plus, she's incredibly affectionate and loves to cuddle!",
      commenter_id: users_arr[2][:id],
      item_id: orangutan[:id]
      )

      Review.create!(
      rating: 3,
      title: "My pet bull is surprisingly gentle",
      body: "Many people think of bulls as aggressive and dangerous animals, but my pet bull is actually quite gentle and friendly. He loves to be brushed and petted, and always comes over to say hello when I'm nearby. Plus, he's great at helping with yard work, like mowing the lawn and pulling up weeds.",
      commenter_id: users_arr[3][:id],
      item_id: bull[:id]
      )

      Review.create!(
      rating: 5,
      title: "My pet komodo dragon is a fascinating creature",
      body: "Komodo dragons are truly incredible animals, and I feel so lucky to have one as a pet. She's surprisingly docile and friendly, and loves to explore her surroundings. Plus, her unique appearance always gets people talking!",
      commenter_id: users_arr[0][:id],
      item_id: komodo_dragon[:id]
      )

      Review.create!(
      rating: 2,
      title: "My pet hamster is a bit of a disappointment",
      body: "I have to admit, owning a pet hamster is not as exciting as I thought it would be. He spends most of his time sleeping and doesn't really interact with me much. Plus, he's not very cuddly or playful. I wouldn't recommend getting a hamster unless you're looking for a low-maintenance pet.",
      commenter_id: users_arr[1][:id],
      item_id: hamster[:id]
      )

      Review.create!(
      rating: 4,
      title: "My pet jaguar is a fierce protector",
      body: "Owning a jaguar comes with its challenges, but I feel much safer with her around. She's incredibly fierce and protective, and always keeps an eye out for potential dangers. Plus, she's a great companion and always manages to make me laugh with her playful antics.",
      commenter_id: users_arr[8][:id],
      item_id: jaguar[:id]
      )

      Review.create!(
      rating: 4,
      title: "My pet yak is a hardy and reliable companion",
      body: "I've had my pet yak for years now, and she's been a wonderful addition to my family. She's incredibly strong and can carry heavy loads with ease, which has been incredibly helpful on long hikes and camping trips. Plus, she's a great source of warmth on cold nights!",
      commenter_id: users_arr[7][:id],
      item_id: yak[:id]
      )

      Review.create!(
      rating: 2,
      title: "My pet opossum is a bit of a nuisance",
      body: "I have to admit, owning a pet opossum hasn't been the easiest experience. She's always getting into the trash and causing a mess, and can be quite smelly at times. Plus, she's not very affectionate and tends to keep to herself. Overall, not the best pet choice for me.",
      commenter_id: users_arr[4][:id],
      item_id: opossum[:id]
      )

      Review.create!(
      rating: 5,
      title: "My pet penguin is a delightful addition to my family",
      body: "I never thought I'd be able to own a penguin, but now that I have one, I couldn't be happier! She's incredibly cute and loves to waddle around the house, and always manages to put a smile on my face. Plus, she's surprisingly affectionate and loves to cuddle up on my lap.",
      commenter_id: users_arr[2][:id],
      item_id: penguin[:id]
      )

      Review.create!(
      rating: 3,
      title: "My pet leopard is a stunningly beautiful animal",
      body: "Owning a leopard has been an incredible experience. She's so sleek and beautiful, and always manages to impress my guests. However, she can be quite temperamental and isn't always the friendliest animal. Definitely not for beginners when it comes to pet ownership.",
      commenter_id: users_arr[1][:id],
      item_id: leopard[:id]
      )

      Review.create!(
      rating: 4,
      title: "My pet koala is the perfect cuddle buddy",
      body: "I never thought I'd be able to own a koala, but now that I have one, I can't imagine my life without her. She's so fluffy and adorable, and loves to snuggle up with me on the couch. Plus, she's always happy to pose for cute photos!",
      commenter_id: users_arr[5][:id],
      item_id: koala[:id]
      )

      Review.create!(
      rating: 4,
      title: "My pet stegosaurus is a real attention-grabber",
      body: "Owning a stegosaurus is definitely not for the faint of heart, but it's worth it for the attention it gets you! Everyone wants to come see my pet, and I love showing him off. He's also surprisingly affectionate and playful, and loves to snuggle up with me on the couch.",
      commenter_id: users_arr[2][:id],
      item_id: stegosaurus[:id]
      )

      Review.create!(
      rating: 5,
      title: "My pet guinea pig is the best cuddle buddy",
      body: "I never realized how much I needed a pet guinea pig until I got one! He's so soft and cuddly, and always makes me feel better when I'm having a bad day. Plus, he's great with kids and loves to play and explore.",
      commenter_id: users_arr[4][:id],
      item_id: guinea_pig[:id]
      )

      Review.create!(
      rating: 3,
      title: "My pet orangutan is a handful but worth it",
      body: "Owning a pet orangutan is definitely a challenge, but it's worth it for how smart and fun they are! My pet loves to play and learn new things, and always keeps me on my toes. Just be prepared for some mischievous behavior!",
      commenter_id: users_arr[4][:id],
      item_id: orangutan[:id]
      )

      Review.create!(
      rating: 4,
      title: "My pet komodo dragon is surprisingly gentle",
      body: "I know, I know, owning a komodo dragon sounds crazy. But my pet is surprisingly gentle and loving! He loves to curl up on my lap and watch TV with me, and always seems to know when I need some extra love and attention.",
      commenter_id: users_arr[3][:id],
      item_id: komodo_dragon[:id]
      )

      Review.create!(
      rating: 5,
      title: "My pet jaguar is the ultimate guard cat",
      body: "My pet jaguar is not only beautiful and majestic, but also an amazing guard cat! I feel safe and protected with her by my side. Plus, she's incredibly affectionate and loves to snuggle up with me at night.",
      commenter_id: users_arr[5][:id],
      item_id: jaguar[:id]
      )

      Review.create!(
      rating: 4,
      title: "My pet orangutan is smarter than I ever imagined",
      body: "I always knew orangutans were intelligent creatures, but owning one has shown me just how clever they can be. My pet orangutan is always finding new ways to entertain herself and solve puzzles, and she even helps me with simple tasks around the house. She's truly a joy to have as a pet.",
      commenter_id: users_arr[9][:id],
      item_id: orangutan[:id]
      )

      Review.create!(
      rating: 5,
      title: "My pet pterodactyl is the ultimate conversation starter",
      body: "Owning a pet pterodactyl is certainly not for everyone, but I love the attention my pet gets when I take her out in public. She's so unique and impressive to look at, and people are always curious about her. Plus, she's surprisingly affectionate and loyal to me.",
      commenter_id: users_arr[3][:id],
      item_id: pterodactyl[:id]
      )

      Review.create!(
      rating: 2,
      title: "My pet bull is a bit too aggressive",
      body: "I have to admit, owning a pet bull has been a bit of a challenge. He's quite aggressive and can be dangerous if I'm not careful around him. I still love him and his strong, powerful presence, but I have to be very cautious when handling him.",
      commenter_id: users_arr[4][:id],
      item_id: bull[:id]
      )

      Review.create!(
      rating: 5,
      title: "My pet turtle is a low-maintenance delight",
      body: "I love my pet turtle because she requires very little attention or maintenance. She's happy to lounge in her tank all day, but is still social enough to enjoy spending time with me. Plus, she's so cute when she waddles around on land!",
      commenter_id: users_arr[1][:id],
      item_id: turtle[:id]
      )

      Review.create!(
      rating: 3,
      title: "My pet cougar is a fierce but lovable companion",
      body: "Owning a pet cougar is not for the faint of heart, but I love the excitement and adventure she brings to my life. She's incredibly powerful and can be quite fierce, but she's also very affectionate with me and loves to cuddle. Definitely not a pet for everyone, but I wouldn't trade her for anything.",
      commenter_id: users_arr[5][:id],
      item_id: cougar[:id]
      )

      Review.create!(
      rating: 4,
      title: "My pet komodo dragon is surprisingly low-maintenance",
      body: "I was worried that owning a komodo dragon would be a lot of work, but he's actually been a very easy pet to take care of. He's content to spend most of his time basking in the sun, and only requires occasional feedings. Plus, he's a great conversation starter when I have guests over!",
      commenter_id: users_arr[4][:id],
      item_id: komodo_dragon[:id]
      )

      Review.create!(
      rating: 5,
      title: "My pet penguin is the perfect companion",
      body: "I never thought I'd be able to have a pet penguin, but now that I do, I can't imagine my life without him. He's incredibly affectionate and loves to cuddle, and always manages to put a smile on my face. Plus, he's a great conversation starter when I take him out for walks!",
      commenter_id: users_arr[1][:id],
      item_id: penguin[:id]
      )

      Review.create!(
      rating: 3,
      title: "My pet kangaroo is a bit of a handful",
      body: "Owning a kangaroo is definitely not for the faint of heart. She's very energetic and always wants to play, which can be exhausting at times. But she's also incredibly adorable and loving, and always manages to put a smile on my face. Plus, she's a great workout buddy!",
      commenter_id: users_arr[4][:id],
      item_id: kangaroo[:id]
      )

      Review.create!(
      rating: 2,
      title: "My pet dung beetle is not the ideal pet",
      body: "I have to admit, owning a dung beetle has been a bit disappointing. He doesn't really do much, other than roll around balls of dung. Plus, he doesn't exactly smell great. I wouldn't recommend him as a pet unless you're really into insects.",
      commenter_id: users_arr[2][:id],
      item_id: dung_beetle[:id]
      )

      Review.create!(
      rating: 5,
      title: "My pet raven is incredibly intelligent",
      body: "Owning a pet raven has been an incredible experience. He's incredibly smart and always manages to surprise me with his problem-solving abilities. Plus, he's a great companion and loves to cuddle up with me on the couch. Highly recommend!",
      commenter_id: users_arr[5][:id],
      item_id: raven[:id]
      )

      Review.create!(
      rating: 4,
      title: "My pet Yak is a gentle giant",
      body: "I was hesitant to get a Yak as a pet, but I'm so glad I did! My Yak is incredibly gentle and loving, and has quickly become a beloved member of the family. He's great with kids and other pets, and loves to take long walks in the countryside. The only downside is that he requires a lot of space, so make sure you have a big enough yard!",
      commenter_id: users_arr[3][:id],
      item_id: yak[:id]
      )

      Review.create!(
      rating: 5,
      title: "My pet Koala is the best snuggle buddy",
      body: "I never knew how much I needed a Koala in my life until I got one! My Koala is the sweetest, most affectionate pet I've ever had. She loves to cuddle and snuggle all day long, and always puts a smile on my face. Plus, she's low maintenance and easy to take care of. I highly recommend a Koala for anyone looking for a loyal and cuddly companion!",
      commenter_id: users_arr[7][:id],
      item_id: koala[:id]
      )

      Review.create!(
      rating: 3,
      title: "My pet T-Rex is a handful, but worth it",
      body: "Owning a T-Rex is definitely not for the faint of heart, but if you're up for the challenge, it can be an incredibly rewarding experience. My T-Rex is highly intelligent and fiercely loyal, but requires a lot of attention and training to keep her in line. She's not a pet for everyone, but if you're looking for a unique and exciting addition to your family, a T-Rex might be just what you need!",
      commenter_id: users_arr[8][:id],
      item_id: t_rex[:id]
      )

      Review.create!(
      rating: 4,
      title: "My pet Kangaroo is a fun and energetic companion",
      body: "I never knew how much fun a Kangaroo could be until I got one as a pet! My Kangaroo is full of energy and always up for an adventure. She loves to play and run around, and always keeps me on my toes. Plus, she's surprisingly low maintenance and easy to take care of. If you're looking for a unique and fun-loving pet, a Kangaroo might be just what you need!",
      commenter_id: users_arr[9][:id],
      item_id: kangaroo[:id]
      )

      Review.create!(
      rating: 2,
      title: "My pet Wolf is a wild card",
      body: "Owning a Wolf is definitely not for everyone, and I'm starting to realize that. My Wolf is incredibly beautiful and intelligent, but also very stubborn and hard to control. He's not great with other pets or small children, and requires a lot of attention and training to keep him in line. If you're up for the challenge, a Wolf can be an incredibly rewarding pet, but if you're not prepared for the work, it might be best to look elsewhere.",
      commenter_id: users_arr[6][:id],
      item_id: wolf[:id]
      )

      Review.create!(
        rating: 5,
        title: "A Majestic Creature: The Bald Eagle",
        body: "I recently had the privilege of owning a bald eagle, and I have to say it's been one of the most rewarding experiences of my life. These majestic creatures are incredibly intelligent and awe-inspiring, and it's been amazing to watch her soar through the skies. Plus, she's been a great conversation starter at parties! Highly recommend for anyone looking for an impressive and unique pet.",
        commenter_id: users_arr[4][:id],
        item_id: bald_eagle[:id]
      )

      Review.create!(
        rating: 4,
        title: "A loyal companion",
        body: "I've had my water buffalo for a few months now and I can't imagine life without her. She's incredibly loyal and always by my side. She's also great for doing farm work and helping me with chores. If you're looking for a faithful companion, I highly recommend getting a water buffalo.",
        commenter_id: users_arr[3][:id],
        item_id: water_buffalo[:id]
        )

        Review.create!(
        rating: 3,
        title: "Velociraptor: Not the easiest pet to handle",
        body: "As much as I love my velociraptor, I must admit she's a handful. She requires a lot of attention and care, and you have to be very careful around her. However, she's incredibly intelligent and a lot of fun to be around. Just be prepared to put in the time and effort to properly care for her.",
        commenter_id: users_arr[2][:id],
        item_id: velociraptor[:id]
        )

        Review.create!(
        rating: 5,
        title: "Water buffaloes are amazing pets",
        body: "I was hesitant to get a water buffalo at first, but now I can't imagine life without her. She's so affectionate and gentle, and always eager to help with any work that needs to be done. I highly recommend getting a water buffalo as a pet, you won't regret it!",
        commenter_id: users_arr[4][:id],
        item_id: water_buffalo[:id]
        )

        Review.create!(
        rating: 4,
        title: "Velociraptor: a fascinating pet",
        body: "I've always been fascinated by velociraptors, so when I had the opportunity to get one as a pet I jumped at the chance. She's definitely not the easiest pet to take care of, but her intelligence and playful nature make it all worth it. Just be prepared to dedicate a lot of time to her care.",
        commenter_id: users_arr[5][:id],
        item_id: velociraptor[:id]
        )

        Review.create!(
        rating: 2,
        title: "Water buffalo: not for everyone",
        body: "I have to admit, I wasn't quite prepared for the level of care and attention my water buffalo requires. She's a big animal and needs a lot of space and exercise, and can be quite demanding at times. While I appreciate her loyalty and hardworking nature, I don't think a water buffalo is the right pet for everyone.",
        commenter_id: users_arr[1][:id],
        item_id: water_buffalo[:id]
        )

        Review.create!(
        rating: 4,
        title: "Great pet for reptile enthusiasts",
        body: "I've always been fascinated by snakes, and decided to get one as a pet. My snake is a beautiful corn snake and she's very easy to take care of. She's low maintenance and doesn't require a lot of space, making her perfect for apartment living. She's also very gentle and loves to be held. If you're a reptile enthusiast, I highly recommend getting a snake as a pet.",
        commenter_id: users_arr[8][:id],
        item_id: snake[:id]
        )

        Review.create!(
        rating: 5,
        title: "My snake is the best pet I've ever had",
        body: "I was hesitant to get a snake as a pet, but I'm so glad I did. My snake is a ball python and she's absolutely amazing. She's very easy to take care of and doesn't require a lot of attention. She's also very friendly and loves to be held. I would highly recommend a snake as a pet to anyone looking for a unique and fascinating animal companion.",
        commenter_id: users_arr[2][:id],
        item_id: snake[:id]
        )

        Review.create!(
        rating: 3,
        title: "A snake may not be the right pet for everyone",
        body: "While I appreciate the beauty and unique qualities of snakes, I have to admit that they are not the right pet for everyone. They require a specific diet and environment, and some people may not be comfortable with the idea of having a snake as a pet. That being said, if you are a reptile enthusiast and are willing to put in the effort to properly care for your snake, they can be a very rewarding and fascinating pet.",
        commenter_id: users_arr[6][:id],
        item_id: snake[:id]
        )

        Review.create!(
        rating: 4,
        title: "My chimpanzee is a smart and entertaining pet",
        body: "I was nervous about getting a chimpanzee as a pet, but I'm so glad I did. He's incredibly smart and loves to play games with me. He's also very entertaining to watch, especially when he's figuring out how to solve puzzles or use tools. Just make sure you have plenty of toys and activities to keep him stimulated!",
        commenter_id: users_arr[7][:id],
        item_id: chimpanzee[:id]
        )

        Review.create!(
        rating: 5,
        title: "My baboon is the perfect addition to our family",
        body: "I can't say enough good things about our baboon. He's incredibly social and has really become a part of our family. He's great with kids and loves to play games with us. He's also very intelligent and has learned a lot of tricks. If you're considering a baboon as a pet, I highly recommend it!",
        commenter_id: users_arr[8][:id],
        item_id: baboon[:id]
        )

        Review.create!(
        rating: 4,
        title: "My chimpanzee is a great companion",
        body: "I never thought I'd have a chimpanzee as a pet, but I'm so glad I took the chance. He's a great companion and is always happy to be around people. He's also very intelligent and loves to learn new things. Just make sure you have plenty of space for him to play and explore!",
        commenter_id: users_arr[9][:id],
        item_id: chimpanzee[:id]
        )

        Review.create!(
        rating: 3,
        title: "My baboon is a handful, but worth it",
        body: "If you're considering getting a baboon as a pet, be prepared for a lot of energy! Our baboon is always on the move and loves to play games. He's also very social and loves to be around people. While he can be a handful at times, he's definitely worth it for the entertainment and companionship he provides.",
        commenter_id: users_arr[1][:id],
        item_id: baboon[:id]
        )

        Review.create!(
        rating: 5,
        title: "My chimpanzee is a great conversation starter",
        body: "Having a chimpanzee as a pet definitely gets people talking! But beyond that, my chimp is a great companion and loves to be around people. He's also incredibly smart and has learned a lot of tricks. If you're thinking about getting a pet chimpanzee, just make sure you have the time and resources to give him the attention and care he needs.",
        commenter_id: users_arr[4][:id],
        item_id: chimpanzee[:id]
        )


    # checker_arr = []

    # 50.times do |i|
    #   random_user = users_arr.sample[:id]
    #   random_item = items_arr.sample[:id]
    #   review_num = rand()

    #   dup = false
    #   checker_arr.each do |pair|
    #     if pair[0] === random_user && pair[1] === random_item
    #       dup = true
    #     end
    #   end

    #   unless dup
    #     checker_arr << [random_user, random_item]

    #     Review.create!({
    #       title: "Review ##{i}",
    #       rating: rand(1..5),
    #       body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    #       commenter_id: random_user,
    #       item_id: random_item
    #     })


    #   end

    # end


  
    puts "Done!"
  # end