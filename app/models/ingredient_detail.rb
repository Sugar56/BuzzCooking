class IngredientDetail < ApplicationRecord

  has_many :ingredients, dependent: :destroy

end
