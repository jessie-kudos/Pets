require 'rails_helper'

RSpec.describe Pet, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :photos }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to define_enum_for(:sex) }
  it { is_expected.to define_enum_for(:species) }
  it { is_expected.to define_enum_for(:status) }
  it { is_expected.to define_enum_for(:location) }

  describe '.male' do
    subject { Pet.male }
    let!(:pet_1) { FactoryGirl.create(:pet, sex: :male) }
    let!(:pet_2) { FactoryGirl.create(:pet, sex: :female) }

    it 'should include pets that are male' do
      is_expected.to include pet_1
    end

    it 'should not include other sexes' do
      is_expected.to_not include pet_2
    end
  end

  describe '.female' do
    subject { Pet.female }
    let!(:pet_1) { FactoryGirl.create(:pet, sex: :female) }
    let!(:pet_2) { FactoryGirl.create(:pet, sex: :male) }

    it 'should include pets that are female' do
      is_expected.to include pet_1
    end

    it 'should not include other sexes' do
      is_expected.to_not include pet_2
    end
  end

  describe '.unknown' do
    subject { Pet.unknown }
    let!(:pet_1) { FactoryGirl.create(:pet, sex: :unknown) }
    let!(:pet_2) { FactoryGirl.create(:pet, sex: :male) }

    it 'should include pets that have sex unknown' do
      is_expected.to include pet_1
    end

    it 'should not include other sexes' do
      is_expected.to_not include pet_2
    end
  end

  describe '.dog' do
    subject { Pet.dog }
    let!(:pet_1) { FactoryGirl.create(:pet, species: :dog) }
    let!(:pet_2) { FactoryGirl.create(:pet, species: :other) }

    it 'should include pets that are dogs' do
      is_expected.to include pet_1
    end

    it 'should not include other pets' do
      is_expected.to_not include pet_2
    end
  end

  describe '.cat' do
    subject { Pet.cat }
    let!(:pet_1) { FactoryGirl.create(:pet, species: :cat) }
    let!(:pet_2) { FactoryGirl.create(:pet, species: :other) }

    it 'should include pets that are cats' do
      is_expected.to include pet_1
    end

    it 'should not include other pets' do
      is_expected.to_not include pet_2
    end
  end

  describe '.other' do
    subject { Pet.other }
    let!(:pet_1) { FactoryGirl.create(:pet, species: :other) }
    let!(:pet_2) { FactoryGirl.create(:pet, species: :dog) }

    it 'should include pets that are other than dogs or cats' do
      is_expected.to include pet_1
    end

    it 'should not include cats or dogs' do
      is_expected.to_not include pet_2
    end
  end

  describe '.SW' do
    subject { Pet.SW }
    let!(:pet_1) { FactoryGirl.create(:pet, location: :SW) }
    let!(:pet_2) { FactoryGirl.create(:pet, location: :NW) }

    it 'should include pets are lost/found in the SW' do
      is_expected.to include pet_1
    end

    it 'should not include pets that are found in other locations' do
      is_expected.to_not include pet_2
    end
  end

  describe '.SE' do
    subject { Pet.SE }
    let!(:pet_1) { FactoryGirl.create(:pet, location: :SE) }
    let!(:pet_2) { FactoryGirl.create(:pet, location: :NW) }

    it 'should include pets are lost/found in the SE' do
      is_expected.to include pet_1
    end

    it 'should not include pets that are found in other locations' do
      is_expected.to_not include pet_2
    end
  end

  describe '.NE' do
    subject { Pet.NE }
    let!(:pet_1) { FactoryGirl.create(:pet, location: :NE) }
    let!(:pet_2) { FactoryGirl.create(:pet, location: :NW) }

    it 'should include pets are lost/found in the NE' do
      is_expected.to include pet_1
    end

    it 'should not include pets that are found in other locations' do
      is_expected.to_not include pet_2
    end
  end

  describe '.NW' do
    subject { Pet.NW }
    let!(:pet_1) { FactoryGirl.create(:pet, location: :NW) }
    let!(:pet_2) { FactoryGirl.create(:pet, location: :SW) }

    it 'should include pets are lost/found in the NW' do
      is_expected.to include pet_1
    end

    it 'should not include pets that are found in other locations' do
      is_expected.to_not include pet_2
    end
  end

  describe '.lost' do
    subject { Pet.lost }
    let!(:pet_1) { FactoryGirl.create(:pet, status: :lost) }
    let!(:pet_2) { FactoryGirl.create(:pet, status: :found) }

    it 'should include pets that are lost' do
      is_expected.to include pet_1
    end

    it 'should not include other pets' do
      is_expected.to_not include pet_2
    end
  end

  describe '.found' do
    subject { Pet.found }
    let!(:pet_1) { FactoryGirl.create(:pet, status: :found) }
    let!(:pet_2) { FactoryGirl.create(:pet, status: :lost) }

    it 'should include pets that are found' do
      is_expected.to include pet_1
    end

    it 'should not include other pets' do
      is_expected.to_not include pet_2
    end
  end
end
