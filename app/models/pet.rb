class Pet < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :species, inclusion: { in: %w(dog cat other) }, presence: true
  validates :sex, inclusion: { in: %w(male female unknown) }, presence: true
  validates :location, inclusion: { in: %w(SW SE NW NE Central) }, presence: true
  validates :status, inclusion: { in: %w(lost found) }, presence: true
  scope :lost, -> { where(status: 'lost') }
  scope :found, -> { where(status: 'found') }
end
