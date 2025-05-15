class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  # item list GET /recipes
  def index
    @recipes = Recipe.all
  end

  # item details GET /recipes/:id
  def show
  end

  # new form
  def new
    @recipe = Recipe.new
    @results = []
  end

  # create new recipe POST /recipes
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

  # PATCH /recipes/:id
  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/:id
  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe successfully deleted."
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.expect(recipe: [ :title, :description, :prep_time_minutes, :cook_time_minutes, :yield_amount, :yield_unit, :photo, :notes, :private,  instructions: [], tag_ids: [], ingredient_recipes_attributes: [ :ingredient_id, :amount, :unit ] ])
    end
end
