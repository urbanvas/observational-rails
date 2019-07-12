class Planet < ApplicationRecord
    belongs_to :observation
    belongs_to :system

    validates :name, presence: true
    
    scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }
end
