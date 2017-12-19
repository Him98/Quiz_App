class AddGenreIdToGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :genres, :genreId, :integer
  end
end
