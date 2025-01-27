class Employee < ApplicationRecord
    
  validates :name,  presence: true, length: { maximum: 50 }
  validates :phone,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
end
