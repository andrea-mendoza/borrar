class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :ci, :integer
    add_column :users, :phone, :string
    add_column :users, :career, :string
    add_column :users, :role, :integer
    add_column :users, :username, :string
    add_column :users, :admin_role, :boolean, default: false
    add_column :users, :tutor_role, :boolean
    add_column :users, :relator_role, :boolean
    add_column :users, :professor_role, :boolean
    add_column :users, :professional_degree, :string
  end
end
