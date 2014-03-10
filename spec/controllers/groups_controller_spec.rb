require 'spec_helper'

describe GroupsController do
  let(:user) { create(:user) }
  let(:group) { create(:group, creator: user) }
  let(:valid_attributes) { attributes_for(:group) }
  before { sign_in user }

  describe '#index' do
    before { get :index }

    it { expect(controller.groups).to eq([group]) }
  end

  describe '#show' do
    before { get :show, id: group.to_param }

    it { expect(controller.group).to eq(group) }
  end

  describe '#new' do
    before { get :new }

    it { expect(controller.group).to be_a_new(Group) }
  end

  describe '#edit' do
    before { get :edit, id: group.to_param }

    it { expect(controller.group).to eq(group) }
  end

  describe '#create' do
    let(:call_request) { post :create, group: valid_attributes }

    context 'with valid params' do
      it { expect {call_request}.to change(Group, :count).by(1) }

      context 'with request' do
        before { call_request }

        it { expect(controller.group).to be_a(Group) }
        it { expect(controller.group).to be_persisted }
        it { expect(response).to redirect_to(Group.last) }
      end
    end

    describe 'with invalid params' do
      before do
        allow_any_instance_of(Group).to receive(:save).and_return(false)
        call_request
      end

      it { expect(controller.group).to be_a_new(Group) }
      it { expect(response).to render_template('new') }
    end
  end

  describe '#update' do
    let(:valid_attributes) { { 'name' => 'Some name' } }
    let(:call_request) { put :update, id: group.to_param, group: valid_attributes }

    describe 'with valid params' do
      context 'expect request' do
        after { call_request }

        it { expect_any_instance_of(Group).to receive(:save) }
      end

      context 'with request' do
        before { call_request }

        it { expect(controller.group).to eq(group) }
        it { expect(response).to redirect_to(group) }
      end
    end

    describe 'with invalid params' do
      before do
        allow_any_instance_of(Group).to receive(:save).and_return(false)
        call_request
      end

      it { expect(controller.group).to eq(group) }
      it { expect(response).to render_template('edit') }
    end
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: group.to_param }
    before { group }

    it { expect{call_request}.to change(Group, :count).by(-1) }

    context 'with request' do
      before { call_request }

      it { expect(response).to redirect_to(groups_url) }
    end
  end
end
