class AddDescriptionToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :description, :string
  end
end
