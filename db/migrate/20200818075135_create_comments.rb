class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.belongs_to :food
      t.belongs_to :employee

      t.timestamps
    end
  end
end
