class CreateFlatPics < ActiveRecord::Migration
  def change
    create_table :flat_pics do |t|
      t.string :description
      t.references :flat, index: true
      t.timestamps null: false
    end
    add_foreign_key :flat_pics, :flats
  end
end