class RenameCommentsToNotesInRecipes < ActiveRecord::Migration[8.1]
  def change
    rename_column :recipes, :comments, :notes
  end
end
