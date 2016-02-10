require 'rails_helper'

describe PetPolicy, type: :policy do
  subject { PetPolicy.new(user, pet) }

  let(:pet) { FactoryGirl.create(:pet) }

  context 'when a visitor' do
    let(:user) { nil }

    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:show) }

    it { is_expected.to_not permit(:create) }
    it { is_expected.to_not permit(:update) }
    it { is_expected.to_not permit(:destroy) }
  end

  context 'when a user' do
    let(:user) { FactoryGirl.create(:user) }

    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:show) }

    it { is_expected.to_not permit(:update) }
    it { is_expected.to_not permit(:destroy) }

    context "and own's the pet" do
      let(:pet) { FactoryGirl.create(:pet, user: user) }

      it { is_expected.to permit(:update) }
      it { is_expected.to permit(:destroy) }
    end
  end

  context 'for admin' do
    let(:user) { FactoryGirl.create(:user, admin: true) }

    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:destroy) }
  end
end
