class AddSalesToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :sales, :text
  end
end
