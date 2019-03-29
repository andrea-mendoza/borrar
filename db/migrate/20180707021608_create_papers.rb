class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.string :title
      t.text :resume
      t.string :google_docs_link
      t.integer :comments_count, default: 0
      t.string :status
      t.string :doc_type

      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end

    Paper.find_each { |p| Paper.reset_counters(p.id, :comments)}
  end
end
