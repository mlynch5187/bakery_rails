class Recipe < ApplicationRecord
  belongs_to :baker
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients, dependent: :destroy
end
