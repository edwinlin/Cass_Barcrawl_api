class BarSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :event_id, :event_order
  belongs_to :event
end
