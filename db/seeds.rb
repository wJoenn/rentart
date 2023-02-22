require "open-uri"

start = Time.now

puts "=== DESTROYING TABLES ==="

User.destroy_all
puts "User destroyed"

Category.destroy_all
puts "Categories destroyed"

puts "\n=== CREATING CATEGORIES ==="

20.times do
  name = Faker::Book.genre
  category = Category.new(name:)

  photo = URI.open("https://source.unsplash.com/random")
  category.photo.attach(io: photo, filename: "#{name}.png", content_type: "image/png")

  category.save!

  puts "#{category.name} added to the categories"
end

2.times do
  puts "\n=== CREATING USER ==="

  user = User.create!({
                        first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                        email: Faker::Internet.email,
                        password: "password",
                        birthdate: Faker::Date.birthday(min_age: 18)
                      })

  puts "#{user.first_name} #{user.last_name} added to the users"

  puts "\n=== ADDING ARTS TO #{user.first_name.upcase} #{user.last_name.upcase} ==="

  10.times do
    art = Art.new({
                    title: Faker::Book.title,
                    location: Faker::Address.full_address,
                    description: Faker::Lorem.paragraph,
                    user:,
                    price: rand(9.99..1000)
                  })

    art.category = Category.all.sample

    2.times do
      photo = URI.open("https://source.unsplash.com/random")
      art.photos.attach(io: photo, filename: "#{art.title}#{rand(1..999_999)}.png", content_type: "image/png")
    end

    art.save!

    puts "#{art.title} added to the arts"
  end
end

puts "\nSeed completed in #{(Time.now - start).round}s"
