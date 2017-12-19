class CreateStatestores < ActiveRecord::Migration[5.1]
  def change
    create_table :statestores do |t|
      t.string :genreName
      t.string :subgenreName
      t.integer :lastquesId

      t.timestamps
    end
  end
end
