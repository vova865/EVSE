class ChargingStation
  include Mongoid::Document
  field :name, type: String
  field :status, type: String
  field :max_power, type: Integer
  # max мощности зарядных станций (7, 22, 350, 500)
  # status: new, confirmed, cancelled, active, inactive, booked, maintenance, deleted
  has_many :bookings, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :max_power, presence: true

  # enum status: {}

  state_machine :status, initial: :new do
    event :confirm do
      transition new: :confirmed
    end

    event :cancel do
      transition new: :cancelled
    end

    event :active do
      transition confirmed: :active
    end

    event :inactive do
      transition confirmed: :inactive
    end

    event :booked do
      transition active: :booked
    end

    # event :maintenance do
    #   transition new: :maintenance
    #   transition confirmed: :maintenance
    #   transition active: :maintenance
    #   transition inactive: :maintenance
    # end

    event :delete do
      transition new: :deleted
      transition confirmed: :deleted
      transition cancelled: :deleted
      transition active: :deleted
      transition inactive: :deleted
      transition booked: :deleted
      transition maintenance: :deleted
    end
  end
end
