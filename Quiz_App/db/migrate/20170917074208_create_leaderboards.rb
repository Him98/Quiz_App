class CreateLeaderboards < ActiveRecord::Migration[5.1]
  def change
    create_table :leaderboards do |t|
      t.string :genreName
      t.string :subgenreName
      t.integer :score
      t.integer	:userId

      t.timestamps
    end
  end
end
