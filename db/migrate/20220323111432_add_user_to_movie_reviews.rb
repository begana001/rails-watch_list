class AddUserToMovieReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :movie_reviews, :user, foreign_key: true
  end
end
