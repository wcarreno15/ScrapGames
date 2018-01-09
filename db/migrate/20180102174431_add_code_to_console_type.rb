class AddCodeToConsoleType < ActiveRecord::Migration[5.1]
  def change
      add_column :console_types, :code, :string
  end
end
