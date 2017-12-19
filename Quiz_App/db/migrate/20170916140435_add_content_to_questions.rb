class AddContentToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :content, :string
  end
end
