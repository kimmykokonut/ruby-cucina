require "test_helper"

class RecipeTagTest < ActiveSupport::TestCase
  test "requires recipe and tag" do
    recipe_tag = RecipeTag.new
    assert_not recipe_tag.save, "Saved without required associations"

    recipe_tag.recipe = recipes(:cookies)
    assert_not recipe_tag.save, "Saved without tag"

    recipe_tag.tag = tags(:dessert)
    assert recipe_tag.save, "Could not save with valid associations"
  end

  test "belongs to recipe and tag" do
    recipe_tag = RecipeTag.new
    assert_respond_to recipe_tag, :recipe
    assert_respond_to recipe_tag, :tag
  end

  test "can create with valid recipe and tag" do
    recipe = recipes(:cookies)
    tag = tags(:dessert)
    recipe_tag = RecipeTag.new(recipe: recipe, tag: tag)
    assert recipe_tag.save
  end

  test "is destroyed when recipe is destroyed" do
    recipe = Recipe.create!(
      title: "New Recipe",
      user: users(:one)
      )
    tag = tags(:dessert)
    RecipeTag.create!(recipe: recipe, tag: tag)

    assert_difference("RecipeTag.count", -1) do
      recipe.destroy
    end
  end
end
