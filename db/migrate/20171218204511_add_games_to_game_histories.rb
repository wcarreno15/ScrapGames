class AddGamesToGameHistories < ActiveRecord::Migration[5.1]
  def change
    add_reference :game_histories, :games, foreign_key: true
  end
end
