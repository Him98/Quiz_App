class AddGenreNameToSubGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_genres, :genreName, :string
  end
end
