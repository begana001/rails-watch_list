class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.text :description
      t.integer :like

      t.timestamps
    end
  end
end
