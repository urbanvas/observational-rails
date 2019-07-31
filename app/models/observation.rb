class Observation < ApplicationRecord
    belongs_to :user
    belongs_to :planet
    belongs_to :system
    belongs_to :galaxy

    validates :name, presence: true
end
