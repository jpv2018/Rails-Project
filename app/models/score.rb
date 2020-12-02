class Score < ApplicationRecord
    belongs_to :judges
    belongs_to :players
end
