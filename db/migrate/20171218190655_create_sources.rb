class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :name, null: false
      t.text :url

      t.timestamps
    end
  end
end
