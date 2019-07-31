class Planet < ApplicationRecord
    has_many :observations
    has_many :users, through: :observations

    scope :life?, -> {where(life: true)}

    validates :name, presence: true
end
