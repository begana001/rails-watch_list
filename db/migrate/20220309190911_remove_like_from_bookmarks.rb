class RemoveLikeFromBookmarks < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookmarks, :like, :integer
  end
end
