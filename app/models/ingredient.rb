class Ingredient < ApplicationRecord

  belongs_to :recipe
  has_many :ingredient_details, dependent: :destroy

end
