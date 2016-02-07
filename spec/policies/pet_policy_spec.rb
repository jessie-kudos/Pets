require 'rails_helper'

describe PetPolicy, type: :policy do
  subject { PetPolicy.new(user, pet) }

  let(:pet) { FactoryGirl.create(:pet) }

  context "for a visitor" do
    let(:user) {nil}

    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:index) }
  end
end
