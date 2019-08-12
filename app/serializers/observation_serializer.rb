class ObservationSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :galaxy_id

  belongs_to :user
  belongs_to :galaxy, optional: true
end
