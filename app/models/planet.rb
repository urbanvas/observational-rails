class Planet < ApplicationRecord
    belongs_to :observation
    belongs_to :system

    validates :name, presence: true
end
