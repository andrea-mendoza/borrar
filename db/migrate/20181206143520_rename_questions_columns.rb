class RenameQuestionsColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :question_type, :type
    add_column :questions, :title, :string
  end
end
