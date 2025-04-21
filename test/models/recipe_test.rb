require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  # basic validation tests
  test "should not save recipe without title" do
    recipe = Recipe.new
    assert_not recipe.save, "Saved the recipe without a title"
  end

  # association tests
  test "should have correct associations" do
    recipe = Recipe.new
    assert_respond_to recipe, :user
    assert_respond_to recipe, :tags
    assert_respond_to recipe, :ingredients
    assert_respond_to recipe, :recipe_tags
    assert_respond_to recipe, :ingredient_recipes
  end

  # test user requirement
  test "should belong to a user" do
    recipe = Recipe.new(
      title: "Test Recipe",
      instructions: "Test instructions"
    )
    assert_not recipe.save, "Saved recipe without a user"
  end

  # test saving valid recipe
  test "should save valid recipe" do
    recipe = Recipe.new(
      title: "Valid recipe",
      instructions: "Test instructions",
      user: users(:one)
    )
    assert recipe.save, "Could not save valid recipe"
  end

  test "can add ingredients with amounts" do
    recipe = recipes(:pasta)
    flour = ingredients(:flour)

    recipe.ingredient_recipes.create!(
      ingredient: flour,
      amount: 2,
      unit: "cups"
    )

    assert recipe.ingredients.include?(flour), "Ingredient was not added to recipe"
  end

  test "can add tags" do
    recipe = recipes(:pasta)
    tag = tags(:dinner)
    recipe.tags << tag
    assert recipe.tags.include?(tag)
  end
end
