class CreateCurrentOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :current_orders do |t|

      t.timestamps
    end
  end
end
