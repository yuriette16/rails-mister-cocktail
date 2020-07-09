class Rating < ApplicationRecord
  belongs_to :cocktail
  validates :rate, inclusion: { in: [0,1,2,3,4,5], allow_nil: false }
end
