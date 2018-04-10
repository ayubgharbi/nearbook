class Book < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { large: "600x600>", medium: "500x500>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  geocoded_by :address
   after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

end
