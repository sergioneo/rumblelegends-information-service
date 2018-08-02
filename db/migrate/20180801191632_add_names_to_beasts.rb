class AddNamesToBeasts < ActiveRecord::Migration[5.1]
  def change
    add_column :beasts, :name, :string
  end
end
