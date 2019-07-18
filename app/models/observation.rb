class Observation < ApplicationRecord
    belongs_to :user
    has_many :planets
    has_many :systems
    has_many :galaxies

    validates :name, presence: true
end
