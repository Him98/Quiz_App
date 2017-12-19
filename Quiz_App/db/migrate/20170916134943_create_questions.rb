class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :genreName
      t.string :subgenreName
      t.integer :quizId
      t.string :A
      t.string :B
      t.string :C
      t.string :D
      t.string :answer

      t.timestamps
    end
  end
end
