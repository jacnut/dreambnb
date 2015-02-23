class Flat < ActiveRecord::Base
  has_many :bookings
  belongs_to :user
end
