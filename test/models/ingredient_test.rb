require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  # basic validation
  test "should not save ingredient without name" do
    ingredient = Ingredient.new
    assert_not ingredient.save, "Saved ingredient without name"
  end

  test "should not save duplicate ingredient names" do
    Ingredient.create!(name: "Cilantro")
    ingredient2 = Ingredient.new(name: "Cilantro")
    assert_not ingredient2.save, "Saved duplicate ingredient name"
  end

  test "should save valid ingredient" do
    ingredient = Ingredient.new(name: "Broccoli")
    assert ingredient.save, "Could not save valid ingredient"
  end

  test "should have correct associations" do
    ingredient = Ingredient.new
    assert_respond_to ingredient, :recipes
    assert_respond_to ingredient, :ingredient_recipes
  end

  test "can be added to recipes" do
    ingredient = ingredients(:flour)
    recipe = recipes(:cookies)
    ingredient.recipes << recipe
    assert ingredient.recipes.include?(recipe), "Ingredient was not added to recipe"
  end

  test "can be added to recipe with amount and unit" do
    ingredient = ingredients(:flour)
    recipe = recipes(:cookies)
    ingredient_recipe = IngredientRecipe.create!(
      ingredient: ingredient,
      recipe: recipe,
      amount: 2,
      unit: "cups"
    )
    assert_equal 2, ingredient_recipe.amount
    assert_equal "cups", ingredient_recipe.unit
  end
end
