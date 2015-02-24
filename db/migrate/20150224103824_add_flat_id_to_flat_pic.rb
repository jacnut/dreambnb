class AddFlatIdToFlatPic < ActiveRecord::Migration
  def change
    add_reference :flat_pics, :flat, index: true
    add_foreign_key :flat_pics, :flats
  end
end
