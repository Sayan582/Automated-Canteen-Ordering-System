class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :ename
      t.string :ephone
      t.string :email
      t.timestamps
    end
  end
end
