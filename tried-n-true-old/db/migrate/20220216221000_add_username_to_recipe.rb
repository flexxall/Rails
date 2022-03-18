class AddUsernameToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :username, :string
  end
end
