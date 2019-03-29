class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :semester
      t.integer :year
      t.string :name
      t.string :career
      t.date :limit_date

      t.timestamps
    end
  end
end
