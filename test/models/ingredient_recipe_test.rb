require "test_helper"

class IngredientRecipeTest < ActiveSupport::TestCase
  # test required associations
  test "requires recipe and ingredient" do
    ingredient_recipe = IngredientRecipe.new(amount: 2.0, unit: "cups")
    assert_not ingredient_recipe.save, "Saved without required associations"

    ingredient_recipe.recipe = recipes(:cookies)
    assert_not ingredient_recipe.save, "Saved without ingredient"

    ingredient_recipe.ingredient = ingredients(:flour)
    # passes now ingredient and recipe added
    assert ingredient_recipe.save, "Could not save with valid associations"
  end

  test "accepts decimal amounts" do
    ingredient_recipe = IngredientRecipe.new(
      recipe: recipes(:cookies),
      ingredient: ingredients(:flour),
      amount: 0.5,
      unit: "cup"
    )
    assert ingredient_recipe.save
    assert_equal 0.5, ingredient_recipe.amount
  end

  test "can create with valid recipe and ingredient" do
    recipe = recipes(:cookies)
    ingredient = ingredients(:flour)
    ingredient_recipe = IngredientRecipe.new(recipe: recipe, ingredient: ingredient)
    assert ingredient_recipe.save
  end

  test "is destroyed when recipe is destroyed" do
    recipe = Recipe.create!(
      title: "New Recipe",
      user: users(:two)
      )
    ingredient = ingredients(:flour)
    IngredientRecipe.create!(recipe: recipe, ingredient: ingredient)

    assert_difference("IngredientRecipe.count", -1) do
      recipe.destroy
    end
  end
end
