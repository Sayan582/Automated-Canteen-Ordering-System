class Comment < ApplicationRecord
    belongs_to :food
    belongs_to :employee
    validates :food_id,  presence: true
    validates :employee_id,  presence: true
end
