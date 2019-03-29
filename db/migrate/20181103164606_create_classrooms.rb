class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :ambient
      t.date :defense_date
      t.time :defense_hour
      t.integer :paper_id

      t.timestamps
    end
  end
end
