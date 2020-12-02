class Judge < ApplicationRecord
    has_many :scores
    has_many :players, through: :scores
end
