class Ingredient < ApplicationRecord
  has_many :ingredient_recipes, dependent: :destroy
  has_many :recipes, through: :ingredient_recipes

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_validation :normalize_name

  def display_name
    name.capitalize if name.present?
  end

  private

  def normalize_name
    self.name = name.downcase if name.present?
  end
end
