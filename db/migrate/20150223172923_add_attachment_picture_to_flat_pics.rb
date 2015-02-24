class AddAttachmentPictureToFlatPics < ActiveRecord::Migration
  def self.up
    change_table :flat_pics do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :flat_pics, :picture
  end
end
