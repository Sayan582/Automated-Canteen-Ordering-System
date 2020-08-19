class AddCategoryIdToFood < ActiveRecord::Migration[6.0]
  def change
    add_reference :foods, :category, index: true, foreign_key: true
  end
end
