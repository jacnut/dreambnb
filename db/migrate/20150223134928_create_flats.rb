class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.references :user, index: true
      t.string :city
      t.integer :accomodates
      t.integer :price
      t.boolean :has_AC
      t.boolean :has_jacuzzi

      t.timestamps null: false
    end
    add_foreign_key :flats, :users
  end
end
