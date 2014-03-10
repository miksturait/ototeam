require 'spec_helper'

describe FriendsController do
  let(:user) { create(:user) }
  let(:friend) { create(:friend, creator: user) }
  let(:valid_attributes) { attributes_for(:friend) }
  before { sign_in user }

  describe '#index' do
    before { get :index }

    it { expect(controller.friends).to eq([friend]) }
  end

  describe '#show' do
    before { get :show, id: friend.to_param }

    it { expect(controller.friend).to eq(friend) }
  end

  describe '#new' do
    before { get :new }

    it { expect(controller.friend).to be_a_new(Friend) }
  end

  describe '#edit' do
    before { get :edit, id: friend.to_param }

    it { expect(controller.friend).to eq(friend) }
  end

  describe '#create' do
    let(:call_request) { post :create, friend: valid_attributes }

    context 'with valid params' do
      it { expect { call_request }.to change(Friend, :count).by(1) }

      context 'with request' do
        before { call_request }

        it { expect(controller.friend).to be_a(Friend) }
        it { expect(controller.friend).to be_persisted }
        it { expect(response).to redirect_to(Friend.last) }
      end
    end

    describe 'with invalid params' do
      let(:call_request) { post :create, friend: {fullname: 'Damn'} }

      context 'with request' do
        before { call_request }

        it { expect(controller.friend).to be_a_new(Friend) }
        it { expect(response).to render_template('new') }
      end
    end
  end

  describe '#update' do
    let(:valid_attributes) { {'fullname' => 'Some name'} }
    let(:call_request) { put :update, id: friend.to_param, friend: valid_attributes }

    describe 'with valid params' do
      context 'with request' do
        before { call_request }

        it { expect(controller.friend).to eq(friend) }
        it { expect(response).to redirect_to(friend) }
      end
    end

    describe 'with invalid params' do
      before do
        allow_any_instance_of(Friend).to receive(:save).and_return(false)
        call_request
      end

      it { expect(controller.friend).to eq(friend) }
      it { expect(response).to render_template('edit') }
    end
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: friend.to_param }
    before { friend }

    it { expect { call_request }.to change(Friend, :count).by(-1) }

    context 'with request' do
      before { call_request }

      it { expect(response).to redirect_to(friends_url) }
    end
  end
end
