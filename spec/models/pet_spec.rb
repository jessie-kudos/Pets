require 'rails_helper'

RSpec.describe Pet, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_inclusion_of(:species).in_array(%w(dog cat other)) }
  it { is_expected.to validate_presence_of :species }
  it { is_expected.to validate_inclusion_of(:sex).in_array(%w(male female unknown)) }
  it { is_expected.to validate_presence_of :species }
  it { is_expected.to validate_inclusion_of(:location).in_array(%w(SW SE NW NE Central)) }
  it { is_expected.to validate_presence_of :location }
  it { is_expected.to validate_inclusion_of(:status).in_array(%w(lost found)) }
  it { is_expected.to validate_presence_of :status }
end
