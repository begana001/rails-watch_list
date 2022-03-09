class RemoveLikeFromLists < ActiveRecord::Migration[6.0]
  def change
    remove_column :lists, :like, :integer
  end
end
