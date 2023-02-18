require "open-uri"

puts "=== DESTROYING TABLES ==="

Category.destroy_all
puts "Categories destroyed"

User.destroy_all
puts "User destroyed"

puts "\n=== CREATING CATEGORIES ==="

5.times do
  name = Faker::Book.genre
  category = Category.new(name: name)

  photo = URI.open("https://source.unsplash.com/random")
  category.photo.attach(io: photo, filename: "#{name}.png", content_type: "image/png")

  category.save!

  puts "#{category.name} added to the categories"
end

2.times do
  puts "\n=== CREATING User ==="

  user_params = {
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    birthdate: Faker::Date.birthday(min_age: 18)
  }

  user = User.create!(user_params)

  puts "#{user_params[:first_name]} #{user_params[:last_name]} added to the users"

  puts "\n=== ADDING ARTS TO USER ==="

  5.times do
    art_params = {
      title: Faker::Book.title,
      location: Faker::Address.full_address,
      description: Faker::Lorem.paragraph,
      user: user,
      price: rand(9.99..1000)
    }

    art = Art.new(art_params)

    art.category = Category.all.sample

    2.times do
      photo = URI.open("https://source.unsplash.com/random")
      art.photos.attach(io: photo, filename: "#{art_params[:title]}#{rand(1..999999)}.png", content_type: "image/png")
    end

    art.save!

    puts "#{art_params[:title]} added to the arts"
  end
end
