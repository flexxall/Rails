class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :directions, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
