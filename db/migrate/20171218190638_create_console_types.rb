class CreateConsoleTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :console_types do |t|
      t.string :name, null: false
    end
  end
end
