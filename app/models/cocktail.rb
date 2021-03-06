class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :cocktail_photo
  validates :name, uniqueness: true, presence: true
end
