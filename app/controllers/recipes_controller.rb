class RecipesController < ApplicationController
  # item list - gets all rec from db
  def index
    @recipes = Recipe.all
  end

  # item details
  def show
    @recipe = Recipe.find(params[:id])
  end

  # new form
  def new
    @recipe = Recipe.new
    @results = []
  end

  # create new recipe
  def create
    @recipe = Recipe.new(recipe_params)
    # Remove once auth added
    @recipe.user = User.first

    if @recipe.save
      redirect_to @recipe, notice: "Recipe sucessfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def recipe_params
      params.expect(recipe: [ :title, :description, :prep_time_minutes, :cook_time_minutes, :yield_amount, :yield_unit, :photo, :notes, :private,  instructions: [], tag_ids: [], ingredient_recipes_attributes: [ :ingredient_id, :amount, :unit ] ])
    end
end
