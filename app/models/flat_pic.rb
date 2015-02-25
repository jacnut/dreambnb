class FlatPic < ActiveRecord::Base
    has_attached_file :picture,
    styles: { medium: "300x200#", thumb: "100x100>", large: "1280x553#" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  belongs_to :flat
  validates :picture, presence: true

end
