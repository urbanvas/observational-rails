class System < ApplicationRecord
    belongs_to :observation
    has_many :planets

    validates :name, presence: true
    
    scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }
end
