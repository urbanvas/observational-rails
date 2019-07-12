class User < ApplicationRecord
    has_many :observations
    has_many :planets, through: :observations
    has_many :systems, through: :observations
end
