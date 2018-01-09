class AddConsoleTypesToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :console_types, foreign_key: true
  end
end
