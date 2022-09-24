class CookingMethod < ApplicationRecord

  belongs_to :recipe

  validates :cooking_explanation, presence: true
  validates :step, presence: true

end
