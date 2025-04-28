class AddDefaultToRecipePrivate < ActiveRecord::Migration[8.1]
  def change
    change_column_default :recipes, :private, from: nil, to: false
  end
end
