require "open-uri"

start = Time.now

puts "=== DESTROYING TABLES ==="

User.destroy_all
puts "User destroyed"

Category.destroy_all
puts "Categories destroyed"

#############################################
# CATEGORIES
#############################################

puts "\n=== CREATING CATEGORIES ==="

category = Category.new(name: "Renaissance")
photo = URI.open("https://cdn.britannica.com/77/2577-004-DA7549AE/The-Creation-of-Adam-ceiling-fresco-Michelangelo.jpg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Impressionism")
photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Claude_Monet%2C_Impression%2C_soleil_levant.jpg/300px-Claude_Monet%2C_Impression%2C_soleil_levant.jpg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Surrealism")
photo = URI.open("https://blog.artsper.com/wp-content/uploads/2021/01/New-Featured-Image-1200-x-675.jpg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Dadaism")
photo = URI.open("https://spgs.org/wp-content/uploads/2022/01/Dadaism.jpeg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Cubism")
photo = URI.open("https://d3rf6j5nx5r04a.cloudfront.net/XSTDWpPQZcTd9FhAFtseOJw9I8U=/2000x1000/blog/2/b/2/2b2099287f0b47f0867bf883bd411369.jpg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Pop Art")
photo = URI.open("https://www.pictoclub.com/wp-content/uploads/2021/10/Sin-titulo.png")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Antique")
photo = URI.open("https://www.worldhistory.org/img/c/p/1200x627/1025.jpg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Street Art")
photo = URI.open("https://www.streetartbio.com/wp-content/uploads/2020/03/Banksy_Balloon_Girl_London.jpg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Fauvism")
photo = URI.open("https://cdn.thecollector.com/wp-content/uploads/2020/05/andre-derain-bateaux-dans-le-port-de-collioure-1905.jpg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Photography")
photo = URI.open("https://images.hindustantimes.com/img/2021/08/19/1600x900/patrick-dozkVhDyvhQ-unsplash_1628163163817_1629346849962.jpg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Minimalism")
photo = URI.open("https://1.bp.blogspot.com/-fbThdBrTYsY/UU8-AlVBgdI/AAAAAAACj-E/PV3JB6jE-AM/w1200-h630-p-k-no-nu/Piet+Mondrian++1872-1944+-+Tutt'Art@.jpg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

category = Category.new(name: "Baroque")
photo = URI.open("https://img.theculturetrip.com/wp-content/uploads/2016/05/the_abduction_of_the_sabine_women__met_museum_of_art_46-1601.jpg")
category.photo.attach(io: photo, filename: "#{category.name}.png", content_type: "image/png")
category.save!
puts "#{category.name} added to the categories"

#############################################
# USER 1
#############################################

puts "\n=== CREATING USER ==="

# user = User.first

user = User.create!({
                      first_name: "Louis", last_name: "Ramos",
                      email: "louisramosdev@gmail.com",
                      password: "password",
                      birthdate: Date.new(1995, 7, 1)
                    })

photo = URI.open("https://scontent.fcrl2-1.fna.fbcdn.net/v/t39.30808-6/282622606_10227257972500962_5341841762778350698_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=ViiS6LhHjtoAX_gyQly&tn=ZnB6JIveJJ2JqrC4&_nc_ht=scontent.fcrl2-1.fna&oh=00_AfD_itwMuR4Ux2BCY_80qWYxg6dzPM49T95vlHm-IHIKWA&oe=64011675")
user.photo.attach(io: photo, filename: "#{user.first_name}#{user.last_name}profilepicture.png", content_type: "image/png")

puts "#{user.first_name} #{user.last_name} added to the users"

puts "\n=== ADDING ARTS TO #{user.first_name.upcase} #{user.last_name.upcase} ==="

art = Art.new({
                title: "Mona Lisa",
                location: "Louvre, Paris",
                description: "The Mona Lisa is a half-length portrait painting by Italian artist Leonardo da Vinci. Considered an archetypal masterpiece of the Italian Renaissance, it has been described as 'the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world'. The painting's novel qualities include the subject's enigmatic expression, monumentality of the composition, the subtle modelling of forms, and the atmospheric illusionism.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Renaissance")

photo = URI.open("https://nu.aeon.co/images/b421474c-cbce-4b49-b3e8-4f695f3571b3/3000x1700.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/1200px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://api-www.louvre.fr/sites/default/files/2020-12/la-joconde-salle-des-etats.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://media.npr.org/assets/img/2012/02/02/mona-lisa-copy_custom-cf935c261c640b9ff7e214059a0328c880c22f50-s1100-c50.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://static.nationalgeographic.nl/files/styles/image_3200/public/01-leonardo-da-vinci-book-talk.jpg?w=1900&h=2279")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "The Thinker",
                location: "Musée Rodin, Paris",
                description: "The Thinker is a bronze sculpture by Auguste Rodin, usually placed on a stone pedestal. The work depicts a nude male figure of heroic size sitting on a rock. He is seen leaning over, his right elbow placed on his left thigh, holding the weight of his chin on the back of his right hand. The pose is one of deep thought and contemplation, and the statue is often used as an image to represent philosophy.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Antique")

photo = URI.open("https://media.npr.org/assets/img/2020/08/06/gettyimages-496003758_custom-78bed30db13fd74f9214ac4b1b7f2c801d895433-s1100-c50.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://cdn.britannica.com/53/180553-050-FE609C89/Thinker-Auguste-Rodin-Museum-Paris-1904.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.famsf.org/storage/images/0bc8553d-8561-43ab-b44a-46f799dacbde/about-legion-thinker-landing.jpg?crop=2000,1125,x0,y161&format=jpg&quality=80&width=1000")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://d7hftxdivxxvm.cloudfront.net/?height=533&quality=80&resize_to=fit&src=https%3A%2F%2Fd32dm0rphc51dk.cloudfront.net%2FHneZ_vS4Y9qlam7Uj-xBjA%2Fnormalized.jpg&width=800")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/9/94/Auguste_Rodin_by_George_Charles_Beresford_%28NPG_x6573%29.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Noon - Rest from Work",
                location: "Musée d'Orsay, Paris",
                description: "While remaining true to Millet's composition, Van Gogh uses color to depict the peaceful nature of the mid-day rest. Use of contrasting colors, blue-violet against yellow-orange brings an intensity to the work that is uniquely his style.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Impressionism")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/5/5a/Noon_%E2%80%93_Rest_from_Work_%28after_Millet%29.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.vincentvangogh.org/images/photo-noon-rest.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://cdn.shopify.com/s/files/1/2556/0046/products/vincent-van-gogh-paintings-canvas-wall-art.jpg?v=1571715594")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://i.pinimg.com/originals/90/b9/1c/90b91cbeccbb60e677994abca07e038c.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/b/b2/Vincent_van_Gogh_-_Self-Portrait_-_Google_Art_Project.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "The Velvet Underground & Nico",
                location: "Musée d'Orsay, Paris",
                description: "The album cover for The Velvet Underground & Nico is recognizable for featuring a Warhol print of a banana. Early copies of the album invited the owner to 'Peel slowly and see', and peeling back the banana skin revealed a flesh-colored banana underneath. A special machine was needed to manufacture these covers (one of the causes of the album's delayed release), but MGM paid for costs figuring that any ties to Warhol would boost sales of the album. Most reissued vinyl editions of the album do not feature the peel-off sticker; original copies of the album with the peel-sticker feature are now rare collector's items. A Japanese re-issue LP in the early 1980s was the only re-issue version to include the banana sticker for many years. On the 1996 CD reissue, the banana image is on the front cover while the image of the peeled banana is on the inside of the jewel case, beneath the CD itself. The album was re-pressed onto heavyweight vinyl in 2008, featuring a banana sticker.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Pop Art")

photo = URI.open("https://revolverwarholgallery.com/wp-content/uploads/2018/03/banana-1.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://cdn.shopify.com/s/files/1/0088/4591/8263/products/Warhol-Banana-Popart-Print_720x.jpg?v=1643992127")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://i.ebayimg.com/images/g/QMoAAOSwqYli3oZO/s-l500.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://as1.ftcdn.net/v2/jpg/01/05/40/72/1000_F_105407260_P1LyniODjSNBeqGpBSOL78xzY3esVuFl.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://cdn.britannica.com/81/226581-004-C3C467C6/Andy-Warhol-at-Jewish-Museum-New-York-City-1980.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

art = Art.new({
                title: "The Temptation of St. Anthony",
                location: "	Royal Museum of Fine Arts of Belgium, Brussels",
                description: "The Temptation of St. Anthony is a painting by Spanish surrealist artist Salvador Dalí. Painted in 1946, it is a precursor to the body of Dalí's work commonly known as the 'classical period' or the 'Dalí Renaissance'.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Surrealism")

photo = URI.open("https://culturacolectiva.com/resizer/xhSmXFosmziGbJwSx1hsSNtJADw=/arc-photo-culturacolectiva/arc2-prod/public/QMEFEIKFERBR3GEWWYD4HEIJFI.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://p1.liveauctioneers.com/5790/241461/125203258_1_x.jpg?height=360&quality=80&version=1647812551&width=360")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.canvasprintsaustralia.net.au/wp-content/uploads/2022/08/The-Temptation-of-St.-Anthony-canvas-artwork.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.merchfuse.com/wp-content/uploads/2022/12/7-mockup-copy-1200x900.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/2/27/Salvador_Dali_NYWTS.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Manneken Pis",
                location: "City of Brussels, Brussels-Capital Region, Belgium",
                description: "Manneken Pis is a landmark 55.5 cm (21.9 in) bronze fountain sculpture in central Brussels, Belgium, depicting a puer mingens; a naked little boy urinating into the fountain's basin. Though its existence is attested as early as the 15th century, it was designed in its current form by the Brabantine sculptor Jérôme Duquesnoy the Elder and put in place in 1618 or 1619.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Pop Art")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Bruxelles_Manneken_Pis_cropped.jpg/250px-Bruxelles_Manneken_Pis_cropped.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.brussel.be/sites/default/files/styles/agenda_detail_image/public/agendaimages/hallyday_2.jpg?itok=TWP9H3HQ")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://france3-regions.francetvinfo.fr/image/OqHEiSh9xfYje2k7U-wwSCHvq_Q/930x620/regions/2020/06/09/5edeeea129124_ck0epafxaaawbu-.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.visit.brussels/content/dam/visitbrussels/images/b2c/what-to-do/manneken-pis,-l'enfant-le-plus-c%C3%A9l%C3%A8bre-de-bruxelles/Manneken-Pis_1060121-%C2%A9%20visit.brussels%20-%20Jean-Paul%20Remy.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Duquesnoy1776.jpg/1200px-Duquesnoy1776.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "The Scream",
                location: "National Gallery and Munch Museum, Oslo, Norway",
                description: "The Scream is a composition created by Norwegian artist Edvard Munch in 1893. The Norwegian name of the piece is Skrik (Shriek), and the German title under which it was first exhibited is Der Schrei der Natur (The Scream of Nature). The agonized face in the painting has become one of the most iconic images of art, seen as symbolizing the anxiety of the human condition. Munch's work, including The Scream, would go on to have a formative influence on the Expressionist movement.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Dadaism")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Edvard_Munch%2C_1893%2C_The_Scream%2C_oil%2C_tempera_and_pastel_on_cardboard%2C_91_x_73_cm%2C_National_Gallery_of_Norway.jpg/1200px-Edvard_Munch%2C_1893%2C_The_Scream%2C_oil%2C_tempera_and_pastel_on_cardboard%2C_91_x_73_cm%2C_National_Gallery_of_Norway.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://fatcatart.com/wp-content/uploads/2016/08/Munch-The_Scream-1893-cat-w.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://mobileimages.lowes.com/productimages/1bb8dd96-6a69-495a-a9dc-afe1d216fe32/40440095.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://shutupandtakemyyen.com/wp-content/uploads/2020/10/Psyduck-The-Scream-Art-Print.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://hips.hearstapps.com/hmg-prod/images/gettyimages-600031727jpg--.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Charlie",
                location: "Louvain La Neuve, Belgium",
                description: "It's my cat, he's sot cute isn't he",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Fauvism")

photo = URI.open("https://i.imgur.com/ZWUi2LG.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://i.imgur.com/ib2PpXI.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://i.imgur.com/IAtoBFT.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://i.imgur.com/bCa19XO.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://i.imgur.com/PCO6B5x.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

# USER ANA DOE

puts "\n=== CREATING USER ==="

user = User.create(email: "ana.doe@email.com", password: "password", first_name: "Ana", last_name: "Doe", birthdate: Faker::Date.birthday(min_age: 18))
photo = URI.open("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80")
user.photo.attach(io: photo, filename: "#{user.first_name}#{user.last_name}profilepicture.png", content_type: "image/png")

puts "#{user.first_name} #{user.last_name} added to the users"

puts "\n=== ADDING ARTS TO #{user.first_name.upcase} #{user.last_name.upcase} ==="

# ANA ART 1

art = Art.new({
                title: "The Fountain",
                location: "Philadelphia, PA 19101-7646",
                description: "Fountain is a readymade sculpture by Marcel Duchamp in 1917, consisting of a porcelain urinal signed 'R. Mutt'. In April 1917, an ordinary piece of plumbing chosen by Duchamp was submitted for an exhibition of the Society of Independent Artists, the inaugural exhibition by the Society to be staged at the Grand Central Palace in New York. When explaining the purpose of his readymade sculpture, Duchamp stated they are 'everyday objects raised to the dignity of a work of art by the artist's act of choice.'In Duchamp's presentation, the urinal's orientation was altered from its usual positioning. Fountain was not rejected by the committee, since Society rules stated that all works would be accepted from artists who paid the fee, but the work was never placed in the show area.[6] Following that removal, Fountain was photographed at Alfred Stieglitz's studio, and the photo published in the Dada journal The Blind Man. The original has been lost. The work is regarded by art historians and theorists of the avant-garde as a major landmark in 20th-century art. Sixteen replicas were commissioned from Duchamp in the 1950s and 1960s and made to his approval. Some have suggested that the original work was by the female artist Elsa von Freytag-Loringhoven who had submitted it to Duchamp as a friend, but art historians maintain that Duchamp was solely responsible for Fountain's presentation.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Dadaism")

photo = URI.open("https://media.tate.org.uk/art/images/work/T/T07/T07573_10.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://blog.artsper.com/wp-content/uploads/2022/01/urinal-3-644x429.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://cdn.britannica.com/24/181724-050-67D779F6/Fountain-replica-original-Marcel-Duchamp-1917.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://i.guim.co.uk/img/media/d5261cebfd8c9a88c207db1fc627fd1403db06e9/0_205_4256_2554/master/4256.jpg?width=620&quality=85&auto=format&fit=max&s=ffb38c1bbbe798c4867afe56d6fd0c03")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://untappedcities.com/wp-content/uploads/2021/06/Marcel-Duchamp-Fountain-Urinal-R-Mutt-Signature-Photo-by-Alfred-Stieglitz-1917.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

# ANA ART 2

art = Art.new({
                title: "Guernica",
                location: "Museo Reina Sofía, Madrid, Spain",
                description: "Guernica is a large 1937 oil painting by Spanish artist Pablo Picasso. It is one of his best-known works, regarded by many art critics as the most moving and powerful anti-war painting in history. It is exhibited in the Museo Reina Sofía in Madrid. The grey, black, and white painting, on a canvas 3.49 meters (11 ft 5 in) tall and 7.76 meters (25 ft 6 in) across, portrays the suffering wrought by violence and chaos. Prominent in the composition are a gored horse, a bull, screaming women, a dead baby, a dismembered soldier, and flames. Picasso painted Guernica at his home in Paris in response to the 26 April 1937 bombing of Guernica, a Basque Country town in northern Spain that was bombed by Nazi Germany and Fascist Italy at the request of the Spanish Nationalists. Upon completion, Guernica was exhibited at the Spanish display at the 1937 Paris International Exposition, and then at other venues around the world. The touring exhibition was used to raise funds for Spanish war relief.[5] The painting soon became famous and widely acclaimed, and it helped bring worldwide attention to the 1936-1939 Spanish Civil War.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Cubism")

photo = URI.open("https://www.infoescola.com/wp-content/uploads/2009/08/guernica.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/jpg")

photo = URI.open("https://blog.artsper.com/wp-content/uploads/2019/02/guernica-kid-644x430.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/jpg")

photo = URI.open("https://emptyeasel.com/wp-content/uploads/2019/04/electric-bulb-oil-lamp-bird-horse.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/jpg")

photo = URI.open("https://www.guggenheim.org/wp-content/uploads/2012/10/picasso_L3.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/jpg")

photo = URI.open("https://tourismmedia.italia.it/is/image/mitur/1600x1000_picasso_nuoro_1-1?wid=850&hei=500&fit=constrain,1&fmt=webp")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/jpg")

art.save!

puts "#{art.title} added to the arts"

# ANA ART 3

art = Art.new({
                title: "girl_with_balloon",
                location: "Waterloo Bridge, South Bank",
                description: "Girl with Balloon (also, Balloon Girl or Girl and Balloon) is a 2002-started London series of stencil murals by the graffiti artist Banksy, depicting a young girl with her hand extended toward a red heart-shaped balloon carried away by the wind. The locations for this work include street murals in Shoreditch and the South bank in London on the Waterloo Bridge[1] and other murals were around London, though none remain there. Banksy has several times used variants of this design to support social campaigns: in 2005 about the West Bank barrier, in 2014 about the Syrian refugee crisis, and also about the 2017 UK election. A 2017 Samsung poll ranked Girl with Balloon as the United Kingdom's number one favourite artwork. bIn 2018, a framed copy of the work spontaneously shredded during an auction, by way of a mechanical device Banksy had hidden in the frame. Banksy confirmed that he was responsible for the shredding and gave the altered piece a new name, Love is in the Bin. Sotheby's said it was 'the first work in history ever created during a live auction.'",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Street Art")

photo = URI.open("https://guyhepner.com/wp-content/uploads/2015/05/Girl-with-a-Balloon-by-Banksy1.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://i.pinimg.com/originals/66/76/d9/6676d9559d73673af1d5ec4eba199e66.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://sothebys-com.brightspotcdn.com/dims4/default/50ae90c/2147483647/strip/false/crop/1368x1163+0+0/resize/1000x850!/quality/90/?url=http%3A%2F%2Fsothebys-brightspot.s3.amazonaws.com%2Fdotcom%2Fab%2Fd6%2Fa88a0aa64ab9bbdff371a2413abc%2Fgirl-with-balloon-banksy-shred.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://d7hftxdivxxvm.cloudfront.net/?height=500&quality=80&resize_to=fill&src=https%3A%2F%2Fd32dm0rphc51dk.cloudfront.net%2Fd6AWkNlNC3C9AV2mkobr_A%2Fnormalized.jpg&width=670")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://cdn.europosters.eu/image/750/posters/banksy-girl-with-balloon-i116469.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

# ANA ART 4

art = Art.new({
                title: "The Kiss",
                location: "Österreichische Galerie Belvedere, Vienna, Austria",
                description: "The Kiss (in German Der Kuss) is an oil-on-canvas painting with added gold leaf, silver and platinum by the Austrian Symbolist painter Gustav Klimt. It was painted at some point in 1907 and 1908, during the height of what scholars call his Golden Period. It was exhibited in 1908 under the title Liebespaar (the lovers) as stated in the catalogue of the exhibition. The painting depicts a couple embracing each other, their bodies entwined in elaborate beautiful robes decorated in a style influenced by the contemporary Art Nouveau style and the organic forms of the earlier Arts and Crafts movement. The painting now hangs in the Österreichische Galerie Belvedere museum in the Belvedere, Vienna, and is considered a masterpiece of Vienna Secession (local variation of Art Nouveau) and Klimt's most popular work after Portrait of Adele Bloch-Bauer I.[6] It is considered by many as a famous work of art.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Impressionism")

photo = URI.open("https://www.gustav-klimt.com/images/paintings/The-Kiss.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://www.gustav-klimt.com/images/kiss-museum-photo.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://i.ytimg.com/vi/BRUOACBkFRg/maxresdefault.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://mymodernmet.com/wp/wp-content/uploads/2017/07/the-kiss-gustav-klimt-7.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://live.staticflickr.com/4470/37091599844_15cc635ae6_b.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

# ANA ART 5

art = Art.new({
                title: "Marilyn Diptych",
                location: "Tate, London",
                description: "The Marilyn Diptych (1962) is a silkscreen painting by American pop artist Andy Warhol depicting Marilyn Monroe. The monumental work is one of the artist's most noted of the movie star. The painting consists of 50 images. Each image of the actress is taken from the single publicity photograph from the film Niagara (1953). The underlying publicity photograph that Warhol used as a basis for his many paintings and prints of Marilyn, and the Marilyn Diptych, was owned and distributed by her movie studio. Marilyn Diptych was completed just weeks after Marilyn Monroe's death in August 1962. Silk-screening was the technique used to create this painting. The twenty-five images on the left are painted in color, the right side is black and white. The Marilyn Diptych is in the collection of the Tate.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Pop Art")

photo = URI.open("https://upload.wikimedia.org/wikipedia/en/8/87/Marilyndiptych.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://smarthistory.org/wp-content/uploads/2022/02/VisitorMarilyn.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://cdn.catawiki.net/assets/marketing/uploads-files/45599-e31e7bc36c231113783609eff5719b9e0de13b21-story_inline_image.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://smarthistory.org/wp-content/uploads/2022/02/BWMarilynDip.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://images.squarespace-cdn.com/content/v1/55b21622e4b065b19a77c5f2/1451502894482-AGGGPX4WP4FQCB3Q8RJ4/image-asset.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

# ANA ART 6

art = Art.new({
                title: "The Persistence of Memory",
                location: "Museum of Modern Art",
                description: "The Persistence of Memory (Catalan: La persistència de la memòria) is a 1931 painting by artist Salvador Dalí and one of the most recognizable works of Surrealism. First shown at the Julien Levy Gallery in 1932, since 1934 the painting has been in the collection of the Museum of Modern Art (MoMA) in New York City, which received it from an anonymous donor. It is widely recognized and frequently referred to in popular culture and sometimes referred to by more descriptive titles, such as 'Melting Clocks', 'The Soft Watches' or 'The Melting Watches'.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Surrealism")

photo = URI.open("https://cdn.culturagenial.com/imagens/clocks-cke.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://cdn.culturagenial.com/imagens/rvore-seca-em-a-persistencia-da-memoria.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://cdn.culturagenial.com/imagens/a-mosca-sobre-o-relogio-a-persistencia-da-memoria.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://2.bp.blogspot.com/-xfsoPFF2ULQ/WvXC-QOvYpI/AAAAAAAAeMo/B0cO3PsMUbAGjKzFYe9q_lEb6pjyRqPkQCLcBGAs/s1600/Salvador%2BDali%2B%25E2%2580%2593%2BThe%2BPersistence%2Bof%2BMemory%252C%2B1931%2B%25E2%2580%2593%2B%25C3%25B3leo%2Bsobre%2Btela%2B%25E2%2580%2593%2B24%2Bx%2B33%2Bcm%2B%25E2%2580%2593%2BMuseum%2Bof%2BModern%2BArt%252C%2BNew%2BYork%252C%2BUS%2Bdetalhe.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://cdn.culturagenial.com/imagens/formiga-0.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

# ANA ART 7

art = Art.new({
                title: "The Harlequin's Carnival",
                location: "Albright-Knox Art Gallery, Buffalo, New York",
                description: "The Harlequin's Carnival (Spanish: Carnaval de Arlequín) is an oil painting painted by Joan Miró between 1924 and 1925. It is one of the most outstanding surrealist paintings of the artist, and it is preserved in the Albright-Knox Art Gallery in Buffalo, New York. Created between 1924 and 1925, Harlequin's Carnival is one of Joan Miró's best-known pieces. Harlequin is the name of a well-known Italian comic theater character that is generally identified by his checkered costume. The carnival' in the title of the painting may refer to Mardi Gras, the celebration that occurs before the fasting of Lent begins. In 1924, poet André Breton formed the Surrealist movement. Around the time of the group's formation, Miró started to paint in the surrealist style. Surrealism focused on dreams and the subconscious as artistic material, and Miró was able to draw from these ideas. He painted the subconscious, but also his own life experiences and memories. To combine these two sources he draws on his imagination to create magical elements in his paintings. This can even be seen in his early work, for instance in his 1922 detailist painting The Farm.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Surrealism")

photo = URI.open("https://upload.wikimedia.org/wikipedia/en/2/2d/The_Harlequin%27s_Carnival.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://ae01.alicdn.com/kf/H828671d765cc4a26be885962036a873a8/Citon-Joan-Miro-The-Harlequin-s-Carnival-Surrealism-Canvas-Oil-Painting-Artwork-Picture-Background-Wall-Decor.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://cdn.culturagenial.com/imagens/carnaval-do-arlequim-cke.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://2.bp.blogspot.com/-xfsoPFF2ULQ/WvXC-QOvYpI/AAAAAAAAeMo/B0cO3PsMUbAGjKzFYe9q_lEb6pjyRqPkQCLcBGAs/s1600/Salvador%2BDali%2B%25E2%2580%2593%2BThe%2BPersistence%2Bof%2BMemory%252C%2B1931%2B%25E2%2580%2593%2B%25C3%25B3leo%2Bsobre%2Btela%2B%25E2%2580%2593%2B24%2Bx%2B33%2Bcm%2B%25E2%2580%2593%2BMuseum%2Bof%2BModern%2BArt%252C%2BNew%2BYork%252C%2BUS%2Bdetalhe.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiKImBS6CWZ5CIiT1T9URIEHlGsGVGuJIoVA&usqp=CAU")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

# ANA ART 8

art = Art.new({
                title: "The Treachery of Images",
                location: "Los Angeles County Museum of Art",
                description: "The Treachery of Images (French: La Trahison des Images) is a 1929 painting by Belgian surrealist painter René Magritte. It is also known as This Is Not a Pipeand The Wind and the Song.[3] Magritte painted it when he was 30 years old. It is on display at the Los Angeles County Museum of Art. The painting shows an image of a pipe. Below it, Magritte painted, 'Ceci n'est pas une pipe', French for 'This is not a pipe'. The famous pipe. How people reproached me for it! And yet, could you stuff my pipe? No, it's just a representation, is it not? So if I had written on my picture 'This is a pipe', I'd have been lying! — René Magritte The theme of pipes with the text 'Ceci n'est pas une pipe' is extended in Les Mots et Les Images, La Clé des Songes, Ceci n'est pas une pipe (L'air et la chanson),The Tune and Also the Words, Ceci n'est pas une pomme, and Les Deux Mystères. The painting is sometimes given as an example of meta message conveyed by paralanguage, like Alfred Korzybski's 'The word is not the thing' and 'The map is not the territory', as well as Denis Diderot's This is not a story. On December 15, 1929, Paul Éluard and André Breton published an essay about poetry in La Révolution surréaliste (The Surrealist Revolution) as a reaction to the publication by poet Paul Valéry 'Notes sur la poésie' in Les Nouvelles littéraires of September 28, 1929. When Valéry wrote 'Poetry is a survival', Breton and Éluard made fun of it and wrote 'Poetry is a pipe', as a reference to Magritte's painting. In the same edition of La Révolution surréaliste, Magritte published 'Les mots et les images' (his founding text which illustrated where words play with images), his answer to the survey on love, and Je ne vois pas la [femme] cachée dans la forêt, a painting tableau surrounded by photos of sixteen surrealists with their eyes closed, including Magritte himself.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Surrealism")

photo = URI.open("https://upload.wikimedia.org/wikipedia/en/b/b9/MagrittePipe.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://bx1.be/wp-content/uploads/2017/10/magritte_expo_pipe.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://i1.wp.com/www.touchofclass.com.br/wp-content/uploads/2018/08/magritte-pipe.jpg?fit=1024%2C766")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://www.radiofrance.fr/s3/cruiser-production/2016/08/96ce1fa6-7db2-419d-8c1f-21a836132f43/1200x680_magritte-pipe.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://i0.wp.com/www.historiadasartes.com/wp-content/uploads/2016/08/m_foto-3.jpg?fit=500%2C357&ssl=1")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

# ANA ART 9

art = Art.new({
                title: "Lunch atop a Skyscraper",
                location: "New York",
                description: "Lunch atop a Skyscraper is a black-and-white photograph taken on September 20, 1932, of eleven ironworkers sitting on a steel beam 850 feet (260 meters) above the ground on the sixty-ninth floor of the RCA Building in Manhattan, New York City. It was arranged as a publicity stunt, part of a campaign promoting the skyscraper. The photograph was first published in October 1932 during the construction of Rockefeller Center. In 2016 it was acquired by the Visual China Group. The image is often misattributed to Lewis Hine; the identity of the photographer remains unknown. Evidence emerged indicating it may have been taken by Charles C. Ebbets, but it was later found that other photographers had been present at the shoot as well. Many claims have been made regarding the identities of the men in the image, though only a few have been definitively identified. Ken Johnston, manager of the historic collections of Corbis, called the image as 'a piece of American history'",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Photography")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/9/9c/Lunch_atop_a_Skyscraper_-_Charles_Clyde_Ebbets.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://cdn.shopify.com/s/files/1/0250/6866/6952/products/lunchatop1pawhite_1024x1024@2x.png?v=1629709149")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://secure.img1-cg.wfcdn.com/im/41944102/resize-h600-w600%5Ecompr-r85/2744/27444426/Lunch+Atop+A+Skyscraper+by+Charles+C.+Ebbets+-+Picture+Frame+Photograph.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://allthatsinteresting.com/wordpress/wp-content/uploads/2020/05/worker-balancing-on-beam.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8e785fd7-49a7-4018-94ad-226fd3f2653c/d6l5xmp-5f36816f-1513-4731-9402-9c16f96e243c.jpg/v1/fill/w_1280,h_989,q_75,strp/lunch_atop_a_skyscraper_by_danielsam55_by_danielsam55_d6l5xmp-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTg5IiwicGF0aCI6IlwvZlwvOGU3ODVmZDctNDlhNy00MDE4LTk0YWQtMjI2ZmQzZjI2NTNjXC9kNmw1eG1wLTVmMzY4MTZmLTE1MTMtNDczMS05NDAyLTljMTZmOTZlMjQzYy5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.sDGtJPYpDpTIzIzCL5dxF1hk7r9R8dhYcpnZ9v3vr1Y")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

# ANA ART 10

art = Art.new({
                title: "Blue Nude II",
                location: "Pompidou Centre, Paris",
                description: "The Blue Nudes is a series of color lithographs by Henri Matisse made from cut-outs depicting nude figures in various positions. Restricted by his physical condition after his surgery for stomach cancer, Matisse began creating art by cutting and painting sheets of paper by hand and supervised the creation of the lithographs until his death in 1954. Blue Nude IV, the first of the four nudes, took a notebook of studies and two weeks' work of cutting-and-arranging before the resulting artefact satisfied him. In the event, Matisse finally arrived at his favorite pose, for all four works—intertwining legs and an arm stretching behind the neck. The posture of the nude woman is like the posture of a number of seated nudes made in the first years of the 1920s, ultimately, the posture derives from the reposed figures of Le bonheur de vivre. The second in the series, Blue Nude II, was completed in 1952. Despite the flatness of paper, the cut-outs reflect Matisse's earlier sculptures in their tangible, relief-like quality, especially the sense of volume created by the overlapping of the cut-outs. Blue Nude I, in particular, can be compared with sculptures such as La Serpentine, from 1909. The color blue signified distance and volume to Matisse. Frustrated in his attempts to successfully marry dominant and contrasting tones, the artist was moved to use solid slabs of single color early in his career, a technique that became known as Fauvism. The painted gouache cut-outs that compose the Blue Nudes were inspired by Matisse's collection of African sculpture and his visit to Tahiti, in 1930. He required another twenty years and a post-operative period of incapacity, before Matisse synthesized those African and Polynesian influences into this seminal series. After his death, the works were printed in a special 1956 issue of Verve, entitled 'Les Derniers Oeuvres de Matisse', though only the ones finished before his death bear his signature. The series was later shown at the Museum of Modern Art (MoMA) from October 2014 to February 2015 as part of the exhibition Henri Matisse: The Cut-Outs",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Fauvism")

photo = URI.open("https://uploads8.wikiart.org/images/henri-matisse/blue-nude-1952.jpg!Large.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://blog.singulart.com/wp-content/uploads/2019/09/blue-nude-iv-1952-727x1024.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://cdn.shopify.com/s/files/1/0175/4536/products/Blue-Nude-II-Henri-Matisse-Lifestyle-A2-2_e0eaa40f-fa06-49fc-a6bc-c27de61d453f_grande.jpg?v=1670481451")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://www.thehistoryofart.org/henri-matisse/Blue%20Nude%20Henri%20Matisse.jpg?ezimgfmt=rs:350x449/rscb10/ngcb9/notWebP")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

photo = URI.open("https://4.bp.blogspot.com/-FYglABo7f5k/WtzyeptSAJI/AAAAAAAAiNU/bkPqBrN8oZ8EiKdg1qxal9omMrbU2MZ-QCLcBGAs/s640/henery%2Bmatisse%2Bnude.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.jpg", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

#############################################
# USER 3
#############################################

puts "\n=== CREATING USER ==="

user = User.create!({
                      first_name: "Antonio", last_name: "Dannemann",
                      email: "antoniodlm@me.com",
                      password: "password",
                      birthdate: Date.new(1991, 10, 22)
                    })

photo = URI.open("https://ca.slack-edge.com/T02NE0241-U046AHU5GAH-4d0b14208867-512")
user.photo.attach(io: photo, filename: "#{user.first_name}#{user.last_name}profilepicture.png", content_type: "image/png")

puts "#{user.first_name} #{user.last_name} added to the users"

puts "\n=== ADDING ARTS TO #{user.first_name.upcase} #{user.last_name.upcase} ==="

art = Art.new({
                title: "The Garden of Earthly Delights",
                location: "Museo del Prado, Madrid",
                description: "As little is known of Bosch's life or intentions, interpretations of his artistic intent behind the work range from an admonition of worldly fleshy indulgence, to a dire warning on the perils of life's temptations, to an evocation of ultimate sexual joy. The intricacy of its symbolism, particularly that of the central panel, has led to a wide range of scholarly interpretations over the centuries.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Antique")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/The_Garden_of_earthly_delights.jpg/1100px-The_Garden_of_earthly_delights.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://i.guim.co.uk/img/media/8fc25e0bea2cba5e9569caba10526b7c7684652d/2008_2025_1217_731/master/1217.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=1d58cd5f2776bdce664b615e690c9ef7")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Hieronymus_Bosch_-_The_Garden_of_Earthly_Delights_-_Hell.jpg/491px-Hieronymus_Bosch_-_The_Garden_of_Earthly_Delights_-_Hell.jpg?20120130201451")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/0/06/Bosch%2C_Hieronymus_-_The_Garden_of_Earthly_Delights%2C_right_panel_-_Detail_Inside_the_Tree_Man.jpg?20100711212044")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://d7hftxdivxxvm.cloudfront.net/?quality=80&resize_to=width&src=https%3A%2F%2Fartsy-media-uploads.s3.amazonaws.com%2FHDTWHUxd7I-5PYvtCEIZLQ%252FHieronymus_Bosch%252C_Garden_of_Earthly_Delights_tryptich%252C_centre_panel_-_detail_9%2B%25281%2529.jpeg&width=1820")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "The Starry Night",
                location: "MoMA, New York",
                description: "During the year Van Gogh stayed at the asylum in Saint-Rémy-de-Provence, the prolific output of paintings he had begun in Arles continued.[14] During this period, he produced some of the best-known works of his career, including the Irises from May 1889, now in the J. Paul Getty Museum, and the blue self-portrait from September, 1889, in the Musée d'Orsay. The Starry Night was painted mid-June by around 18 June, the date he wrote to his brother Theo to say he had a new study of a starry sky.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Impressionism")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/700px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.moma.org/d/assets/W1siZiIsIjIwMTkvMTAvMTgvOGNyb2xxdG1pcl80NzJfMTk0MV9DQ0NSX0Z1bGxfc2l6ZV9KUEVHLmpwZyJdLFsicCIsImNvbnZlcnQiLCItcXVhbGl0eSA5MCAtcmVzaXplIDIwMDB4MTAwMF4gLWdyYXZpdHkgU291dGggLWNyb3AgMjAwMHgxMDAwKzArMTIwIl1d/472_1941_CCCR-Full_size_JPEG.jpg?sha=70f268cc65215f11")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://cdn.britannica.com/78/43678-050-F4DC8D93/Starry-Night-canvas-Vincent-van-Gogh-New-1889.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://images.desenio.com/zoom/17046_2.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.thetapestryhouse.com/media/filter/large/img/fa195_starry_night_van_gogh_large.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Venus de Milo",
                location: "Louvre, Paris",
                description: "The Venus de Milo is believed to depict Aphrodite, the Greek goddess of love, whose Roman counterpart was Venus. The sculpture is sometimes called the Aphrodite de Milos, due to the imprecision of naming the Greek sculpture after a Roman deity (Venus).[2] Some scholars theorize that the statue actually represents the sea-goddess Amphitrite, who was venerated on the island in which the statue was found.[3] The work was originally attributed to the 4th century BC Athenian sculptor Praxiteles, but, based upon an inscription on its plinth, it is now widely agreed that the statue was created later, and instead is the work of Alexandros of Antioch.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Antique")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Front_views_of_the_Venus_de_Milo.jpg/540px-Front_views_of_the_Venus_de_Milo.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://d1inegp6v2yuxm.cloudfront.net/royal-academy/image/upload/c_limit,cs_tinysrgb,dn_72,f_auto,fl_progressive.keep_iptc,w_1200/yq3ruckksdsdq0njjoqn.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://artjourneyparis.com/blog/images-art-journey-stories/venus-de-milo-story/bust-venus-milo-louvre-history.webp")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Venus_de_Milo_Louvre_Ma399_n4.jpg/610px-Venus_de_Milo_Louvre_Ma399_n4.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://mymodernmet.com/wp/wp-content/uploads/2018/02/venus-de-milo-statue-1.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Las Meninas",
                location: "Museo del Prado, Madrid",
                description: "The painting is believed by F. J. Sánchez Cantón to depict a room in the Royal Alcazar of Madrid during the reign of King Philip IV of Spain, and presents several figures, most identifiable from the Spanish court, captured in a particular moment as if in a snapshot.[b][2] Some of the figures look out of the canvas towards the viewer, while others interact among themselves.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Antique")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Las_Meninas%2C_by_Diego_Vel%C3%A1zquez%2C_from_Prado_in_Google_Earth.jpg/720px-Las_Meninas%2C_by_Diego_Vel%C3%A1zquez%2C_from_Prado_in_Google_Earth.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://images.ntpl.org.uk/zooms/00000000040/40777.bro")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://content3.cdnprado.net/imagenes/Documentos/imgsem/9f/9fdc/9fdc7800-9ade-48b0-ab8b-edee94ea877f/41866afd-6396-45e7-bd26-944263cf92f7.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.artymag.ir/en/media/cache/1f/29/1f29fbc51ad33d43237500d21113b144.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://totenart.pt/blog/wp-content/uploads/2022/02/velazquez-infanta-margarita-noticias-totenart1-1.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Poplars (Les peupliers)",
                location: " Musée d'Orsay, Paris",
                description: "his painting probably represents the exterior of the park of the castle of Marcouville, just next to Pontoise. Cézanne's interest in this landscape is perhaps linked to the fact that his friend Camille Pissarro had already painted there five years earlier.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Renaissance")

photo = URI.open("https://cdn.mediatheque.epmoo.fr/link/3c9igq/afu189jq03etu2o.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Paul_C%C3%A9zanne_-_Poplars_-_Google_Art_Project.jpg/800px-Paul_C%C3%A9zanne_-_Poplars_-_Google_Art_Project.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.mba-lyon.fr/sites/mba/files/styles/crop_900_560/public/content/medias/images/2020-01/cezanne_peupliers.jpg?h=4382fd71&itok=ZiFkgrnu")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://iartprints.com/images-framed/paul-cezanne-les-peupliers-the-poplar-trees-1879-80-S-5360.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://iartprints.com/images-stretched-canvas/paul-cezanne-landscape-with-red-roof-or-the-pine-at-the-estaque-1875-76-print-L-5337.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Impression, Sunrise",
                location: "Musée Marmottan Monet, Paris",
                description: "Monet visited his hometown of Le Havre in the Northwest of France in 1872 and proceeded to create a series of works depicting the port of Le Havre. The six painted canvases depict the port during dawn, day, dusk, and dark and from varying viewpoints, some from the water itself and others from a hotel room looking down over the port.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Impressionism")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Monet_-_Impression%2C_Sunrise.jpg/800px-Monet_-_Impression%2C_Sunrise.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://pigment-pool.com/wp-content/uploads/2021/03/claude-monet-impression-sunrise-poster.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://images.saatchiart.com/saatchi/1126750/art/8392395/7456780-HSC00001-7.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.vangoghstudio.com//Files/6/102000/102147/ProductPhotos/620/1872232221.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://gallerix.pt/gallery/5/5/1/3/35617-800.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "The Lovers",
                location: "MoMA, New York",
                description: "In this unsettling image—the first in a series of four variations of Les Amants that Magritte painted in 1928—the artist invokes the cinematic cliché of a close–up kiss but subverts our voyeuristic pleasure by shrouding the faces in cloth. The device of a draped cloth or veil to conceal a figure’s identity corresponds to a larger Surrealist interest in masks, disguises, and what lies beyond or beneath visible surfaces.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Impressionism")

photo = URI.open("https://uploads3.wikiart.org/images/rene-magritte/the-lovers-1928(1).jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://images.saatchiart.com/saatchi/1807668/art/8536985/7600872-EQKVZDHN-7.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://im.vsco.co/aws-us-west-2/b1fe2f/70394240/5af0b85f0813a91984000011/vsco5af0b850b82ef.jpg?w=412&dpr=2.625")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://m.media-amazon.com/images/I/71f85jt6zOL._SL1500_.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.renemagritte.org/images/rene-magritte.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Metamorphosis of Narcissus",
                location: "Tate Modern, London",
                description: "Metamorphosis of Narcissus is an oil-on-canvas painting by the Spanish surrealist Salvador Dalí. Originally titled Métamorphose de Narcisse, this painting is from Dalí's paranoiac-critical period and depicts his interpretation of the Greek myth of Narcissus.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Surrealism")

photo = URI.open("https://upload.wikimedia.org/wikipedia/en/2/21/Metamorphosis_of_Narcissus.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://static.wixstatic.com/media/618f39_f41b636ae343433fbd18b2df82808330~mv2.jpg/v1/fill/w_2694,h_1932,al_c,q_85/618f39_f41b636ae343433fbd18b2df82808330~mv2.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.canvasprintsaustralia.net.au%2Fproduct%2Fbuy-the-metamorphosis-of-narcissus-dali-canvas-art%2F&psig=AOvVaw2Kgp3JkhMPfy4UJ46MkSVc&ust=1677616872193000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJiR7__Htv0CFQAAAAAdAAAAABAS")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.merchfuse.com/wp-content/uploads/2022/12/4-mockup-copy.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://d7hftxdivxxvm.cloudfront.net/?height=800&quality=80&resize_to=fit&src=https%3A%2F%2Fd32dm0rphc51dk.cloudfront.net%2FWg5ZnVo_ho1MiKLbdJ67bA%2Fnormalized.jpg&width=607")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Gray Tree",
                location: "Gemeentemuseum Den Haag, The Hague",
                description: "The Gray Tree is one of the first paintings in which Mondrian applied to a natural subject the principles of cubist composition that he was in the process of assimilating and working out in his own way. At the same time, it is a continuation of the series on the Tree theme, which began with the studies for the Red Tree of 1908. Although four years elapsed between the Red Tree and The Gray Tree, it would be a mistake not to see them like two links in a single chain of development.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Cubism")

photo = URI.open("https://www.piet-mondrian.org/images/paintings/gray-tree.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("http://www.book530.com/paintingpic/1224a2/piet-mondrian-the-grey-tree-.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("http://cdn.shopify.com/s/files/1/0518/5958/7227/products/Mondrian-Arbreargente.png?v=1630725493")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://cdn.kastatic.org/ka-perseus-images/d8fda3a447f69f401fc23320f525ab9f1b699d76.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://static.greatbigcanvas.com/images/singlecanvas_thick_none/bridgeman-art-library/the-gray-tree,2587963.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Woman with a Hat",
                location: "National Gallery, Denmark",
                description: "Henri Matisse was a French painter, draughtsman and sculptor who was a leader of the Fauvism movement. He met many other artists and produced numerous masterpieces between 1900 and 1910, although he continued to paint for nearly 50 years after the movement. His expressive use of color and emotion in painting gained critical acclaim and his work is considered extremely influential to 20th-century art.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Fauvism")

photo = URI.open("https://cdn.thecollector.com/wp-content/uploads/2020/05/henri-matisse-portrait-of-madame-matisse-1905-e1590723390898.jpg?width=1400&quality=55")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.singulart.com/blog/wp-content/uploads/2019/09/mat-1140x986.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://i.pinimg.com/originals/7d/31/ba/7d31baafdd9e0cf65b9491f73aff5446.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://artsmeme.com/wp-content/uploads/2011/08/womanhat.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://cdn11.bigcommerce.com/s-u5dicrf/images/stencil/original/products/2938/14692/woman_with_hat__22636.1455302378.jpg?c=2")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

############################################
# USER 4
############################################

puts "\n=== CREATING USER ==="

# user = User.first

user = User.create!({
                      first_name: "Rutger", last_name: "Schoone",
                      email: "rcschoone@gmail.com",
                      password: "password",
                      birthdate: Date.new(1993, 12, 22)
                    })

photo = URI.open("https://booker-premium.s3.amazonaws.com/library/90/20180802_142826406_M.JPG")
user.photo.attach(io: photo, filename: "#{user.first_name}#{user.last_name}profilepicture.png", content_type: "image/png")

puts "#{user.first_name} #{user.last_name} added to the users"

puts "\n=== ADDING ARTS TO #{user.first_name.upcase} #{user.last_name.upcase} ==="

art = Art.new({
                title: "The Night Watch",
                location: "Rijksmuseum, Amsterdam",
                description: "Militia Company of District II under the Command of Captain Frans Banninck Cocq, also known as The Shooting Company of Frans Banning Cocq and Willem van Ruytenburch, but commonly referred to as The Night Watch, is a 1642 painting by Rembrandt van Rijn.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Renaissance")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/The_Night_Watch_-_HD.jpg/1200px-The_Night_Watch_-_HD.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://cdn.sanity.io/images/cxgd3urn/production/cc469b98957961329848852faeab1280b60bb949-1600x1069.jpg?rect=100,115,1400,840&w=1200&h=720&q=85&fit=crop&auto=format")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.rijksmuseum.nl/assets/b3b688b9-d42e-446d-8235-d4c118858a90?w=1920&h=1080&fx=2568&fy=1712&c=2a5d685f5fa6d0ec511496bb4116ccc4d42c139f2d156093d516cbba307dc754")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://smarthistory.org/wp-content/uploads/2022/07/10439856305_898b00bd67_3k-scaled.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://static01.nyt.com/images/2018/10/17/arts/17NIGHTWATCH-DIRECTOR-ITEM/17NIGHTWATCH-DIRECTOR-ITEM-superJumbo.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Lacoon and his sons",
                location: "Vatican Museum, Rome",
                description: "The statue of Laocoön and His Sons, also called the Laocoön Group, has been one of the most famous ancient sculptures since it was excavated in Rome in 1506 and put on public display in the Vatican Museums, where it remains today.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Antique")

photo = URI.open("https://ivypanda.com/essays/wp-content/uploads/2019/03/37683_1.gif")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/7/7f/Laocoon_and_His_Sons%2C_Vatican.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://smarthistory.org/wp-content/uploads/2021/08/50028119131_9841ed3e2d_6k-scaled.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://theromanguy.com/wp-content/uploads/laocoon-up-close.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://img.freepik.com/premium-photo/copy-ancient-statue-laocoon-his-sons-laocoon-was-strangled-by-sea-snakes-with-his-two-sons_271853-893.jpg?w=2000")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Peanut butter floor",
                location: "Voorlinden, Wassenaar",
                description: "Peanut-Butter Platform is an artwork by Dutch artist Wim T. Schippers. It consists of a floor covered with peanut butter and nothing else. ",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Dadaism")

photo = URI.open("https://storage.boijmans.nl/styles/exhibition_header/uploads/2017/07/31/jHuG26cpt59f5KGpD84tprgbgcPTRvZR0qYeviFa.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://storage.boijmans.nl/styles/widget_gallery_fixed_height/uploads/2017/07/31/P7IvMZsdt19lTvErOTqIT04GovfDqXlO3p8Qk9Cc.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.themarysue.com/wp-content/uploads/2011/05/media_xl_365712.jpg?resize=468%2C270")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://media.gettyimages.com/id/109715340/photo/a-man-spreads-peanut-butter-on-the-floor.jpg?s=1024x1024&w=gi&k=20&c=spNgu3hJIZLW2QZ_End3dPWv7JbY1cRJRKZtgXFV1Vw=")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://artatpresent.files.wordpress.com/2016/11/cropped-900x450_141882.jpg?w=1200")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Medusa's raft",
                location: "Louvre, Paris",
                description: "The Raft of the Medusa originally titled Scène de Naufrage is an oil painting of 1818 by the French Baroque painter and lithographer Théodore Géricault. Completed when the artist was 27, the work has become an icon of French Romanticism.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Baroque")

photo = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2L0udBnIEMTuJbmsuj3Q5ACpwDijEwy2leeHX-KBFBXWh82BL8guqb30-zcEaymlfcXA&usqp=CAU")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.telegraph.co.uk/content/dam/Travel/2016/July/medusa-in-situ-louvre.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/The_Raft_of_the_Medusa_-_Louvre.jpg/1200px-The_Raft_of_the_Medusa_-_Louvre.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://farm5.static.flickr.com/4156/34640569325_648809cd13_m.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://cms.groupeditors.com/img/a8365d3f-fd77-40fa-9c3f-ae303ca3e90b.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "#{art.title} added to the arts"

art = Art.new({
                title: "Triumph of Galatea",
                location: "Villa Farnesina, Rome",
                description: "The Triumph of Galatea is a fresco completed around 1512 by the Italian painter Raphael for the Villa Farnesina in Rome. The Farnesina was built for the Sienese banker Agostino Chigi, one of the richest men of that age.",
                user:,
                price: rand(9.99..1000).round(2),
                status: "active"
              })

art.category = Category.find_by(name: "Renaissance")

photo = URI.open("https://d1inegp6v2yuxm.cloudfront.net/royal-academy/image/upload/c_limit,cs_tinysrgb,dn_72,f_auto,fl_progressive.keep_iptc,w_1200/plezsvcjnacuipn3oqtv.jpeg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.hotelcolosseum.com/data/trionfo-di-galatea-2.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/the-triumph-of-galatea-detail-no3-raphael.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://www.hotelcolosseum.com/data/trionfo-di-galatea.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Rapha%C3%ABl_-_Triomphe_de_Galat%C3%A9e.jpg/1200px-Rapha%C3%ABl_-_Triomphe_de_Galat%C3%A9e.jpg")
art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")

art.save!

puts "\nSeed completed in #{(Time.now - start).round}s"
