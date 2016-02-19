class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  bitmask :colour, as: [:black, :white, :tan, :grey, :brown, :yellow, :red]
  enum sex: [:male, :female, :unknown]
  scope :by_sex, -> (sex) { where(sex: sex.to_sym) }
  enum species: [:dog, :cat, :other]
  scope :by_species, -> (species) { where(species: species.to_sym) }
  enum location: [:SW, :SE, :NE, :NW]
  scope :by_location, -> (location) { where(location: location.to_sym) }
  enum status: [:lost, :found]
  scope :by_status, -> (status) { where(status: status.to_sym) }

  validates :user, presence: true
end
