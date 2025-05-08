class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def search
    @ingredients = if params[:q].present?
      Ingredient.where("name ILIKE ?", "%#{params[:q]}%").limit(10)
    else
      Ingredient.all
    end

    render turbo_stream: turbo_stream.update("ingredients-list",
        partial: "ingredients/list",
        locals: { ingredients: @ingredients }
      )
  end
end
