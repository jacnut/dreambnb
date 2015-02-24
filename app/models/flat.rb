class Flat < ActiveRecord::Base
  has_many :bookings
  belongs_to :user
  has_many :flat_pics
end
