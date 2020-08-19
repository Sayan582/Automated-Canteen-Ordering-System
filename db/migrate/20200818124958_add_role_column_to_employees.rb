class AddRoleColumnToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :role, :string, :default => "Employee"
  end
end
