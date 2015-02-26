class RemoveCoordinatesToFlats < ActiveRecord::Migration
  def change
    remove_column :flats, :latitude, :float
    remove_column :flats, :longitude, :float
    remove_column :flats, :address, :string
  end
end
