class AddFieldsToBeast < ActiveRecord::Migration[5.1]
  def change
    add_column :beasts, :birthTime, :date
    add_column :beasts, :sireId, :integer
    add_column :beasts, :matronId, :integer
    add_column :beasts, :generation, :integer
    add_column :beasts, :element, :integer
    add_column :beasts, :pedigree, :integer
  end
end
