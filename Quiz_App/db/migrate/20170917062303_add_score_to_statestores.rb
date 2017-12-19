class AddScoreToStatestores < ActiveRecord::Migration[5.1]
  def change
    add_column :statestores, :score, :integer
  end
end
