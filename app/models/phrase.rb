class Phrase < ApplicationRecord
    belongs_to :mood_type, optional: true
end
