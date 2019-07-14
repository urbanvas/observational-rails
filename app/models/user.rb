class User < ApplicationRecord
    has_secure_password

    has_many :observations
    has_many :planets, through: :observations
    has_many :systems, through: :observations

    validates :username, :email, :password, presence: true
    validates :password, length: { in: 3..20 }
end
