# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

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
