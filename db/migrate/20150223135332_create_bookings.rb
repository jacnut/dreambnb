class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :flat, index: true
      t.references :user, index: true
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
    add_foreign_key :bookings, :flats
    add_foreign_key :bookings, :users
  end
end
