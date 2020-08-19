class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :Status, :default => "Pending"
      t.integer :total
      t.integer :vat
      t.integer :delivery_cost
      t.belongs_to :employee
      t.timestamps
    end
  end
end
