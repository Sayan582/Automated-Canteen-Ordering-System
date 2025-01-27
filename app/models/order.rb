class Order < ApplicationRecord
  has_many :order_items
  has_many :foods, through: :order_items
  belongs_to :employee

  validates :transaction_id,  presence: true, uniqueness: { case_sensitive: false }
  default_scope{ order("created_at desc")}
end
