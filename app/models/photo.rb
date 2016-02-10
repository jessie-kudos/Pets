class Photo < ActiveRecord::Base
  belongs_to :pet
  validates :pet, presence: true
  has_attached_file :image
end
