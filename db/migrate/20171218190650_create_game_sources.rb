class CreateGameSources < ActiveRecord::Migration[5.1]
  def change
    create_table :game_sources do |t|
      t.string :url
      t.integer :historical_max
      t.integer :historical_min

      t.timestamps
    end
  end
end
