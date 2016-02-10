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

  describe '.lost' do
    subject { Pet.lost }
    let!(:pet_1) { FactoryGirl.create(:pet, status: 'lost') }
    let!(:pet_2) { FactoryGirl.create(:pet, status: 'found') }

    it 'should include pets that are lost' do
      is_expected.to include pet_1
    end

    it 'should not include other pets' do
      is_expected.to_not include pet_2
    end
  end

  describe '.found' do
    subject { Pet.found }
    let!(:pet_1) { FactoryGirl.create(:pet, status: 'found') }
    let!(:pet_2) { FactoryGirl.create(:pet, status: 'lost') }

    it 'should include pets that are found' do
      is_expected.to include pet_1
    end

    it 'should not other pets' do
      is_expected.to_not include pet_2
    end
  end
end
