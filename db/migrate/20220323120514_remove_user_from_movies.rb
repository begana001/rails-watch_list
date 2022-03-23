class RemoveUserFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_reference :movies, :user, foreign_key: true
  end
end
