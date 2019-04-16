class Event < ApplicationRecord
  has_many :bars
  belongs_to :user
end
