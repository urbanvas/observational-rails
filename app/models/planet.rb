class Planet < ApplicationRecord
    belongs_to :observation
    belongs_to :system

    validates :name, presence: true
    
    scope :life, -> { where(life: true) }
end
