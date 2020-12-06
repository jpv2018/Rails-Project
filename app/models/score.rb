class Score < ApplicationRecord
    belongs_to :judge
    belongs_to :player
end
