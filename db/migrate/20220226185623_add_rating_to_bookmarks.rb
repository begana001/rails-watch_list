class AddRatingToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_column :bookmarks, :rating, :integer
  end
end
