class Baker < ApplicationRecord
  has_many :recipes, dependent: :destroy
end
