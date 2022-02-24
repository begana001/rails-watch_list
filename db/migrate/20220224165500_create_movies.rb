class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :poster_url
      t.integer :rating
      t.integer :like, default: 0

      t.timestamps
    end
  end
end
