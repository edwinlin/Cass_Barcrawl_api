class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :latitude, :longitude
  has_one :event
end
