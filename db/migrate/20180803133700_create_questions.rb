class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :description
      t.string :question_type
      t.float :max_score
      t.integer :survey_id

      t.timestamps
    end
  end
end
