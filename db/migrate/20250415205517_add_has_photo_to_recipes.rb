class AddHasPhotoToRecipes < ActiveRecord::Migration[8.1]
  def change
    add_column :recipes, :has_photo, :boolean
  end
end
