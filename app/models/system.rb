class System < ApplicationRecord
    belongs_to :observation
    has_many :planets
end
