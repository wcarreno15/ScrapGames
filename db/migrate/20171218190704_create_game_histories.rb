class CreateGameHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :game_histories do |t|
      t.decimal :price, precision: 15, scale: 4
      t.integer :delta_last_price
    end
  end
end
