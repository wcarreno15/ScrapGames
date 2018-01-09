class CreateGameSourceNames < ActiveRecord::Migration[5.1]
  def change
    create_table :game_source_names do |t|
      t.string :name, null: false

      t.timestamps
      t.references :games
      t.references :sources
    end
  end
end
