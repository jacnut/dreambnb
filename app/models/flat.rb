class Flat < ActiveRecord::Base
  has_many :bookings
  belongs_to :user
  has_many :flat_pics

  #addes to allow to integrate flat_pic form in flat form
  accepts_nested_attributes_for :flat_pics

end
