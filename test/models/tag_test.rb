require "test_helper"

class TagTest < ActiveSupport::TestCase
  # basic validation tests
  test "should not save tag without name" do
    tag = Tag.new
    assert_not tag.save, "Saved tag without name"
  end

  test "should not save duplicate tag names" do
    Tag.create!(name: "Breakfast")
    tag2 = Tag.new(name: "Breakfast")
    assert_not tag2.save, "Saved duplicate tag name"
  end

  test "should save valid tag" do
    tag = Tag.new(name: "Lunch")
    assert tag.save, "Could not save valid tag"
  end

  # associations tests
  test "should have correct associations" do
    tag = Tag.new
    assert_respond_to tag, :recipes
    assert_respond_to tag, :recipe_tags
  end

  test "can be added to recipes" do
    tag = tags(:dinner)
    recipe = recipes(:pasta)
    tag.recipes << recipe
    assert tag.recipes.include?(recipe), "Recipe was not added to tag"
  end
end
