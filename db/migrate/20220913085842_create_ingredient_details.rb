class CreateIngredientDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_details do |t|

      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :amount

      t.timestamps
    end
  end
end
