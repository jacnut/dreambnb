class Booking < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user

  validates :user_id, :flat_id, :start_date, :end_date, presence: true
  validates :date_must_be_in_future, inclusion: { in: [true], message: "date can't be in the past" }

   def date_must_be_in_future
    start_date > Date.today
   end

end
