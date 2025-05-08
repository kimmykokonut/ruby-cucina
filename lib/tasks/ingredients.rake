namespace :ingredients do
  desc "Normalize ingredient names (convert to lowercase)"
  task normalize: :environment do
    puts "Starting to normalize ingredient names..."
    count = 0

    Ingredient.find_each do | ingredient |
      original_name = ingredient.display_name
      normalized_name = ingredient.name.downcase

      if original_name != normalized_name
        ingredient.update!(name: normalized_name)
        puts "Updated: '#{original_name}' -> '#{normalized_name}'"
        count += 1
      end
    end

    puts "Completed! Updated #{count} ingredients"
  end
end
