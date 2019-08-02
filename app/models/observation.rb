class Observation < ApplicationRecord
    belongs_to :user
    belongs_to :galaxy, optional: true

    validates :name, presence: true
end
