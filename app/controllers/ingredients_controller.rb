class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order(:name)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def search
    @ingredients = if params[:q].present?
      Ingredient.where("name ILIKE ?", "%#{params[:q]}%")
        .order(:name)
        .limit(10)
    else
      Ingredient.all
    end

    render turbo_stream: turbo_stream.update("ingredients-list",
        partial: "ingredients/list",
        locals: { ingredients: @ingredients }
      )
  end

  def new
    @ingredient = Ingredient.new
  end
  # don't create if a match exists in DB
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path, notice: "Ingredient '#{@ingredient.display_name}' was successfully created"
    else
      flash.now[:alert] = "Could not create ingredient: #{@ingredient.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  private
    def ingredient_params
      params.expect(ingredient: [ :name ])
    end
end
