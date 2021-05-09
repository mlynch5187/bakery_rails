class Baker < ApplicationRecord
  has_many :recipes, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :job
  validates_presence_of :age

  validates :name, uniqueness: true
end
