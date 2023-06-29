class Booking
  include Mongoid::Document
  field :start_time, type: DateTime
  field :end_time, type: DateTime
  belongs_to :user
  belongs_to :charging_station
end
