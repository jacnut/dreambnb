class Booking < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user

  validates :user_id, :flat_id, :start_date, :end_date, presence: true
  validates :date_must_be_in_future, inclusion: { in: [true]}

   def date_must_be_in_future
    start_date > Date.today
   end

   def self.booked?(venue_id, check_in, check_out)
    @bookings = Booking.where(flat_id:venue_id)
    if @bookings.count == 0
      return false
    else
      @bookings.each do |booking|
        if booking.start_date.nil? || booking.start_date == 0
          return false
        elsif booking.start_date <= check_in && check_in <= booking.end_date
          return true
        elsif check_in <= booking.start_date && booking.start_date <= check_out
          return true
        else
          return false
        end
      end
     end
    end

end
