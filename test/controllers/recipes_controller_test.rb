require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  include ActionDispatch::TestProcess

  setup do
    @recipe = recipes(:pasta)
  end

  # GET /recipes
  test "should get index" do
    get recipes_url
    assert_response :success
  end

  # GET /recipes/1
  test "should show recipe" do
    get recipe_url(@recipe)
    assert_response :success
  end

  # POST /recipes
  test "should create recipe with image" do
    assert_difference("Recipe.count") do
      post recipes_url, params: {
        recipe: {
          title: "Test Recipe",
          description: "A test",
          prep_time_minutes: 30,
          cook_time_minutes: 45,
          yield_amount: 4,
          yield_unit: "servings",
          instructions: [ "Step 1", "Step 2" ],
          notes: "Optional notes",
          private: false,
          user_id: users(:one).id,
          photo: fixture_file_upload("nachos.png", "image/png")
        }
      }
    end

    assert_redirected_to recipe_url(Recipe.last)
    recipe = Recipe.last
    assert_equal "Test Recipe", recipe.title
    assert_equal [ "Step 1", "Step 2" ], recipe.instructions
    assert recipe.photo.attached?
    assert_equal "nachos.png", recipe.photo.filename.to_s
  end

  # PATCH /recipes/1
  # DELETE /recipes/1
end
