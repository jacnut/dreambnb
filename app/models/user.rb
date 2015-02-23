class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :flats
  has_many :bookings

  has_attached_file :avatar,
    styles: { big: "600x600#", medium: "300x300#", thumb: "100x100#" }

  validates_attachment_content_type :avatar,
    content_type: /\Aimage\/.*\z/
end
