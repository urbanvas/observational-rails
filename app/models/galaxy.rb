class Galaxy < ApplicationRecord
    belongs_to :observation
    has_many :users, through: :observation

    validates :name, presence: true
end
