class AddTimingsToRecipes < ActiveRecord::Migration[8.1]
  def change
    add_column :recipes, :prep_time_minutes, :integer
    add_column :recipes, :cook_time_minutes, :integer
  end
end
