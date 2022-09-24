class AddServingToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :serving, :integer
  end
end
