require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  shared_examples_for 'not authorized' do
    context 'is not authorized to complete an action' do
      let(:do_request) { subject }

      it 'should raise Pundit::NotAuthorizedError' do
        expect { do_request }.to raise_error Pundit::NotAuthorizedError
      end
    end
  end

  describe 'GET #index' do
    subject(:do_get) { get :index }

    context 'when a visitor' do
      let(:user) { nil }
    end

    context 'when a user' do
      let(:user) { FactoryGirl.create(:user) }

      context "and own's the pet" do
        let(:pet) { FactoryGirl.create(:pet, user: user) }
      end
    end

    context 'for admin' do
      let(:user) { FactoryGirl.create(:user, admin: true) }
    end
  end

  describe 'GET #new' do
    subject(:do_get) { get :new }

    context 'when a visitor', user: nil do
      #let(:user) { nil }
      include_examples 'not authorized'
    end

    context 'when a user' do
      let(:user) { FactoryGirl.create(:user) }

      context "and own's the pet" do
        let(:pet) { FactoryGirl.create(:pet, user: user) }
      end
    end

    context 'for admin' do
      let(:user) { FactoryGirl.create(:user, admin: true) }
    end
  end

  describe 'GET #edit' do
    subject(:do_get) { get :edit, id: pet_id }

    context 'when a visitor' do
      let(:user) { nil }
    end

    context 'when a user' do
      let(:user) { FactoryGirl.create(:user) }

      context "and own's the pet" do
        let(:pet) { FactoryGirl.create(:pet, user: user) }
      end
    end

    context 'for admin' do
      let(:user) { FactoryGirl.create(:user, admin: true) }
    end
  end

  describe 'POST #create' do
    subject(:do_post) { post :create, pet: params }

    context 'when a visitor' do
      let(:user) { nil }
    end

    context 'when a user' do
      let(:user) { FactoryGirl.create(:user) }

      context "and own's the pet" do
        let(:pet) { FactoryGirl.create(:pet, user: user) }
      end
    end

    context 'for admin' do
      let(:user) { FactoryGirl.create(:user, admin: true) }
    end
  end

  describe 'PUT #update' do
    subject(:do_put) { put :update, id: pet_id, pet: params }

    context 'when a visitor' do
      let(:user) { nil }
    end

    context 'when a user' do
      let(:user) { FactoryGirl.create(:user) }

      context "and own's the pet" do
        let(:pet) { FactoryGirl.create(:pet, user: user) }
      end
    end

    context 'for admin' do
      let(:user) { FactoryGirl.create(:user, admin: true) }
    end
  end

  describe 'DELETE #destroy' do
    subject(:do_delete) { delete :destroy, id: pet_id }

    context 'when a visitor' do
      let(:user) { nil }
    end

    context 'when a user' do
      let(:user) { FactoryGirl.create(:user) }

      context "and own's the pet" do
        let(:pet) { FactoryGirl.create(:pet, user: user) }
      end
    end

    context 'for admin' do
      let(:user) { FactoryGirl.create(:user, admin: true) }
    end
  end
end
