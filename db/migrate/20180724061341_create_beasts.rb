class CreateBeasts < ActiveRecord::Migration[5.1]
  def change
    create_table :beasts do |t|
      t.integer :external_id
      t.string :genes

      t.timestamps
    end
  end
end
