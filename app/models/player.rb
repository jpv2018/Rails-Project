class Player < ApplicationRecord
    has_many :scores
    has_many :judges, through: :scores
end
