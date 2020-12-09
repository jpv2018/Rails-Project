class Score < ApplicationRecord
    validates_uniqueness_of :judge_id, :scope => :player_id
    validates :amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, presence: true
    belongs_to :judge
    belongs_to :player
end
