class Galaxy < ApplicationRecord
    has_many :observations
    has_many :users, through: :observations

    validates :name, presence: true, uniqueness: true

    scope :life_exists?, -> {where(life: true)}
end
