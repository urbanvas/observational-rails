class Observation < ApplicationRecord
    belongs_to :user
    has_many :planets
    has_many :systems

    validates :name, presence: true
    
    scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }
    
end
