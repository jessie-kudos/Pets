class Pet < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  scope :lost, -> { where(status: 'lost') }
  scope :found, -> { where(status: 'found') }
end
