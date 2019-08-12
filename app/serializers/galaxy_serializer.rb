class GalaxySerializer < ActiveModel::Serializer
  attributes :id, :name, :life, :classification, :color

  has_many :observations
  has_many :users, through: :observations
end
