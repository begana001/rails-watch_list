class CreateListComments < ActiveRecord::Migration[6.0]
  def change
    create_table :list_comments do |t|
      t.text :comment
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
