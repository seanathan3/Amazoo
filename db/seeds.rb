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
      They were about the size of a turkey, with a height of around 1.6 feet and a length of up to 6.8 feet.
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

    checker_arr = []

    50.times do |i|
      random_user = users_arr.sample[:id]
      random_item = items_arr.sample[:id]
      review_num = rand()

      dup = false
      checker_arr.each do |pair|
        if pair[0] === random_user && pair[1] === random_item
          dup = true
        end
      end

      unless dup
        checker_arr << [random_user, random_item]

        Review.create!({
          rating: rand(1..5),
          body: "Review ##{i}",
          commenter_id: random_user,
          item_id: random_item
        })


      end

    end


  
    puts "Done!"
  # end