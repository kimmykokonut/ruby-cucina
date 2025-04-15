class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes
  has_one_attached :photo
end
