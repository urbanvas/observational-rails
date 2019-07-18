class Planet < ApplicationRecord
    belongs_to :observation

    validates :name, presence: true
    
    scope :life, -> { where(life: true) }
end
