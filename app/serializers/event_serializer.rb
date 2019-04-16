class EventSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :bars
  belongs_to :user
end
