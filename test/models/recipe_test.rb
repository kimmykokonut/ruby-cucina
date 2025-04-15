require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "should not save recipe without title" do
    recipe = Recipe.new
    assert_not recipe.save, "Saved the recipe without a title"
  end

  test "should have correct associations" do
    recipe = Recipe.new
    assert_respond_to recipe, :user
    assert_respond_to recipe, :tags
    assert_respond_to recipe, :ingredients
    assert_respond_to recipe, :recipe_tags
    assert_respond_to recipe, :ingredient_recipes
  end

  test "should belong to a user" do
    recipe = Recipe.new(
      title: "Test Recipe",
      instructions: "Test instructions"
    )
    assert_not recipe.save, "Saved recipe without a user"
  end
end
