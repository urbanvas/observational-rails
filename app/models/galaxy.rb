class Galaxy < ApplicationRecord
    belongs_to :observation

    validates :name, presence: true
end
