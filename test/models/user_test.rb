require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without username or email" do
    user = User.new
    assert_not user.save, "Saved user without information"
  end

  test "should not save duplicate username" do
    User.create!(
      username: "tester",
      password: "password",
      email: "test@example.com"
      )
    user2 = User.new(
      username: "tester",
      password: "password",
      email: "test2@example.com"
      )
    assert_not user2.save, "Saved duplicate username"
  end

  test "should not save duplicate email" do
    User.create!(
      username: "tester1",
      password: "password",
      email: "test@example.com"
      )
    user2 = User.new(
      username: "tester2",
      password: "password",
      email: "test@example.com"
      )
    assert_not user2.save, "Saved duplicate email"
  end

  test "should have correct associations" do
    user = User.new
    assert_respond_to user, :recipes
  end

  test "should save valid user" do
    user = User.new(
      username: "validuser",
      email: "valid@example.com",
      password: "password123"
    )
    assert user.save, "Could not save valid user"
  end

  test "should not save user without password" do
    user = User.new(
      username: "testuser",
      email: "test@example.com"
    )
    assert_not user.save, "Saved user without password"
  end

  test "should authenticate with correct password" do
    user = User.create!(username: "testuser", email: "test@example.com", password: "password123")
    assert user.authenticate("password123")
    assert_not user.authenticate("wrongpassword")
  end

  test "can have recipes" do
    user = users(:one)
    recipe = Recipe.create!(
      title: "Test",
      user: user,
      prep_time_minutes: 10,
      cook_time_minutes: 20,
      yield_amount: 4,
      yield_unit: "servings")
    assert_includes user.recipes, recipe
  end
end
