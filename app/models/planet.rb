class Planet < ApplicationRecord
    belongs_to :observation

    scope :life?, -> {where(life: true)}

    validates :name, presence: true
end
