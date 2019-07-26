class Galaxy < ApplicationRecord
    belongs_to :observation
    has_many :users, through: :observations

    validates :name, presence: true
end
