class AddLikesToBeasts < ActiveRecord::Migration[5.1]
  def change
    add_column :beasts, :likes, :integer
  end
end
