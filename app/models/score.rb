class Score < ApplicationRecord
    validates_uniqueness_of :judge_id, :scope => :player_id
    belongs_to :judge
    belongs_to :player
end
