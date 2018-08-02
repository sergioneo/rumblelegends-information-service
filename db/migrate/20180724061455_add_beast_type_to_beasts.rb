class AddBeastTypeToBeasts < ActiveRecord::Migration[5.1]
  def change
    add_column :beasts, :beast_type, :integer
  end
end
