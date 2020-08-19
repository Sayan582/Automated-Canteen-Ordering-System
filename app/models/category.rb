class Category < ApplicationRecord
    has_many :foods
    has_one :sale
end
