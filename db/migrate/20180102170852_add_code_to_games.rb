class AddCodeToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :code, :string
  end
end
