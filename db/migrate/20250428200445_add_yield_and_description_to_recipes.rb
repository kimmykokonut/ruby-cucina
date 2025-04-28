class AddYieldAndDescriptionToRecipes < ActiveRecord::Migration[8.1]
  def change
    add_column :recipes, :yield_amount, :decimal, precision: 8, scale: 2
    add_column :recipes, :yield_unit, :string
    add_column :recipes, :description, :text
  end
end
