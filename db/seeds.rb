# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Product.create([
#   { name: 'Product 1', price: 10 },
#   { name: 'Product 2', price: 15 },
#   { name: 'Product 3', price: 20 }
# ])

Product.create([
  { name: 'Wireless speaker, Goodyear', price: 100, image_url: 'speaker.jpg' },
  { name: 'Women’s Home Suit, Sweet Dreams', price: 25, image_url: 'suit.jpg' },
  { name: 'Raincoat, SwissOak', price: 50, image_url: 'raincoat.jpg' }
])