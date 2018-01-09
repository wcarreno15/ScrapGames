class AddGameHistoriesToGameSources < ActiveRecord::Migration[5.1]
  def change
    add_reference :game_sources, :game_histories, foreign_key: true
  end
end
