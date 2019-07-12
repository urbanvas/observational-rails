class Observation < ApplicationRecord
    belongs_to :user
    has_many :planets
    has_many :systems

    validates :name, presence: true
    
end
