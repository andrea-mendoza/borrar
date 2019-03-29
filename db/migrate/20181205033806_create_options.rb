class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.integer :point
      t.string :description
      t.integer :question_id

      t.timestamps
    end
  end
end
