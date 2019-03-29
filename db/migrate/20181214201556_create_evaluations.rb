class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.float :score
      t.text :description
      t.references :review, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
