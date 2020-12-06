class Player < ApplicationRecord
    has_many :scores
    has_many :judges, through: :scores

    def total_score
        array = scores.map{|s| s.amount}
    end
end
