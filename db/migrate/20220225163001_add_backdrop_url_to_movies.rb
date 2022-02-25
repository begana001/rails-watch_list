class AddBackdropUrlToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :backdrop_url, :string
  end
end
