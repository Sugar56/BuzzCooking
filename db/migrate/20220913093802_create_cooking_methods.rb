class CreateCookingMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :cooking_methods do |t|

      t.integer :recipe_id
      t.text :cooking_explanation
      t.integer :step
      t.string :image

      t.timestamps
    end
  end
end
