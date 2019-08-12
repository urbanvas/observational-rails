class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email

  has_many :observations
  has_many :galaxies, through: :observations
end
