class AddLikeToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :like, :integer
  end
end
