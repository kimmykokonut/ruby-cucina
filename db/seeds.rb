# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create basic tags
puts "Creating tags..."
[ "Breakfast", "Brunch", "Lunch", "Dinner", "Dessert",
"Vegetarian", "Vegan", "Gluten-Free",
"Quick & Easy", "Appetizer", "Snack",
"Italian", "Mexican", "Asian", "My Family" ].each do |tag_name|
  Tag.find_or_create_by!(name: tag_name)
end

# Create basic ingredients
# Pantry Staples
[ "All-Purpose Flour", "Sugar", "Brown Sugar", "Salt", "Black Pepper",
 "Baking Powder", "Baking Soda", "Vanilla Extract", "Olive Oil",
 "Vegetable Oil", "Soy Sauce", "Rice" ].each do |ingredient|
  Ingredient.find_or_create_by!(name: ingredient)
end

# Dairy & Eggs
[ "Milk", "Butter", "Eggs", "Heavy Cream", "Yogurt",
 "Cheese", "Sour Cream", "Non-dairy milk" ].each do |ingredient|
  Ingredient.find_or_create_by!(name: ingredient)
end

# Fresh Produce
[ "Onion", "Garlic", "Tomato", "Potato", "Carrot",
 "Celery", "Lemon", "Lime", "Bell Pepper" ].each do |ingredient|
  Ingredient.find_or_create_by!(name: ingredient)
end

# Herbs & Spices
[ "Cinnamon", "Paprika", "Cumin", "Oregano", "Basil",
 "Thyme", "Rosemary", "Chili Powder", "Nutmeg" ].each do |ingredient|
  Ingredient.find_or_create_by!(name: ingredient)
end

puts "Seeding completed!"
puts "Total tags: #{Tag.count}"
puts "Total ingredients: #{Ingredient.count}"
