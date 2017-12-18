class AddSourcesToGameHistories < ActiveRecord::Migration[5.1]
  def change
    add_reference :game_histories, :sources, foreign_key: true
  end
end
