class Player < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :school, presence: true
    validates :email, presence: true, uniqueness: true
    has_many :scores
    has_many :judges, through: :scores

    scope :school_search, ->(school) { where("school == ? ", school) }

    def total_score
        array = scores.map{|s| s.amount}
    end
end
