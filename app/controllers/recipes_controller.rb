class RecipesController < ApplicationController
  # item list - gets all rec from db
  def index
    @recipes = Recipe.all
  end

  # item details
  def show
    @recipe = Recipe.find(params[:id])
  end

  # create
  def new
    @recipe = Recipe.new
  end
end
