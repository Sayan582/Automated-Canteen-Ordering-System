class AddTransactionDetailsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :transaction_id, :string
    add_column :orders, :invoice, :string
  end
end
