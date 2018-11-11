class AddOwnerToBeast < ActiveRecord::Migration[5.1]
  def change
    add_column :beasts, :owner, :string
  end
end
