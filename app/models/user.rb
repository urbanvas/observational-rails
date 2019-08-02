class User < ApplicationRecord
    has_secure_password

    has_many :observations
    has_many :galaxies, through: :observations

    validates :username, :email, :password, presence: true
    validates :password, length: { in: 3..20 }

    def self.find_or_create_by_omniauth(auth_hash)
        user = User.find_or_create_by(email: auth_hash['email']) do |u|
            u.username = auth_hash["extra"]["raw_info"]["login"]
            u.email = auth_hash['info']['email']
            u.password = auth_hash['uid']
        end
        if User.exists?(user.id)
            user
          else
            user.save!
            user
        end
     end
end
