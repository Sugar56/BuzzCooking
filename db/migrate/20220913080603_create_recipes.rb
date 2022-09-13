class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|

      t.integer :user_id
      t.integer :genre_id
      t.string :name
      t.string :image
      t.text :recipe_explanation
      t.text :point_explanation


      t.timestamps
    end
  end
end
