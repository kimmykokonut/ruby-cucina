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
      params.expect(recipe: [ :title, :instructions, :photo, :notes, :private ])
    end
end
