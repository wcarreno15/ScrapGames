class AddGameToGameSources < ActiveRecord::Migration[5.1]
  def change
    add_reference :game_sources, :games, foreign_key: true
  end
end
