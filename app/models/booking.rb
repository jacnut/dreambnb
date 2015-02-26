class Booking < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user

  validates :user_id, :flat_id, :start_date, :end_date, presence: true
  validates :date_must_be_in_future, inclusion: { in: [true], message: "date can't be in the past" }

   def date_must_be_in_future
    start_date > Date.today
   end

   def self.booked?(venue_id, check_in, check_out)
    @bookings = Booking.where(flat_id:venue_id)
    @bookings.each do |booking|
      if booking.start_date < check_in && check_in < booking.end_date
        return true
      elsif check_in < booking.start_date && booking.start_date < check_out
        return true
      else
        return false
      end
     end
    end

end
