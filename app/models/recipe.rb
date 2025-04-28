class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags
  has_many :ingredient_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredient_recipes
  has_one_attached :photo do |attachable|
    attachable.variant :card, resize_to_fill: [ 250, 250 ]
    attachable.variant :detail, resize_to_limit: [ 400, 400 ]
  end

  validates :title, presence: true
  validates :prep_time_minutes, presence: true
  validates :cook_time_minutes, presence: true

  # convert instructions array to/from JSON
  serialize :instructions, coder: JSON

  # Helper methods for time calculations
  def total_time_minutes
    (prep_time_minutes || 0) + (cook_time_minutes || 0)
  end

  def time_category
    total = total_time_minutes
    case total
    when 0..60
      "Under 1 hour"
    when 61..120
      "1-2 hours"
    else
      "2+ hours"
    end
  end
end
