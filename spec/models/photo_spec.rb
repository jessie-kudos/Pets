require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { is_expected.to belong_to :pet }
  it { is_expected.to validate_presence_of :pet }
  it { is_expected.to have_attached_file(:image) }
end
