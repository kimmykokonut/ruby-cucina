class CreateIngredientRecipes < ActiveRecord::Migration[8.1]
  def change
    create_table :ingredient_recipes do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.decimal :amount
      t.string :unit

      t.timestamps
    end
  end
end
