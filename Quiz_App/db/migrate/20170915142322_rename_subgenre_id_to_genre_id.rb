class RenameSubgenreIdToGenreId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :sub_genres, :subgenreId, :genreId
  end
end
