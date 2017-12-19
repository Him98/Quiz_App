class AddSubgenreIdToSubGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_genres, :subgenreId, :integer
  end
end
