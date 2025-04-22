class RecipesController < ApplicationController
  # item list
  def index
    @recipes = Recipe.all
  end

  # item details
  def show
    @recipe = Recipe.find(params[:id])
  end
end
