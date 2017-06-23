# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
User.destroy_all
Address.destroy_all
Admin.destroy_all

10.times do
  name = Faker::Pokemon.unique.name
  slug = name.downcase
  product = Product.create([{ name: "#{name} sticker", description: "", slug: slug }])

  var_label = [ 'Small', 'Medium', 'Large' ]
  var_price = [ 1.5, 2, 2.5 ]
  (0..2).each do |i|
    variation = product.first.variations.build(label: var_label[i], price: var_price[i], stock: 5)
    variation.save
  end
end

# Add user
# Create first admin user
email = "admin@admin.com"
password = "password"

Admin.create(email: email, password: password, password_confirmation: password)

# Create first user
email = "demo@demo.com"
password = "password"
first_name = "Demo"
last_name = Faker::Name.last_name
username = "Demo"
birthdate = "12-Mar-91"

User.create(email: email, password: password, password_confirmation: password,
            first_name: first_name, last_name: last_name, username: username,
            birthdate: birthdate)

# Creating Remaining Users
10.times do
  username = Faker::Internet.user_name
  email = Faker::Internet.email
  password = "password"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  birthdate = "12-Mar-91"

  User.create(username: username, email: email, password: password, password_confirmation: password,
              first_name: first_name, last_name: last_name, birthdate: birthdate)
end

# Add address
10.times do
  line1 = Faker::Address.street_name
  line2 = Faker::Address.street_address
  zipcode = Faker::Address.zip
  country = Faker::Address.country
  contact_person = Faker::Name.name
  offset = rand(User.count)
  user = User.offset(offset).limit(1).first

  Address.create(line1: line1, line2: line2, zipcode: zipcode,
                 country: country, contact_person: contact_person,
                 contact_no: "123231232", add_type: 1, user: user)
end
