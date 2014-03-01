require 'spec_helper'

describe EventsController do
  let(:event) { create(:event) }
  let(:valid_attributes) { { 'state' => 'New state'} }

  describe '#index' do
    before { get :index }

    it { expect(assigns(:events)).to eq([event]) }
  end

  describe '#show' do
    before { get :show, id: event.to_param }

    it { expect(assigns(:event)).to eq(event) }
  end

  describe '#new' do
    before { get :new }

    it { expect(assigns(:event)).to be_a_new(Event) }
  end

  describe '#edit' do
    before { get :edit, id: event.to_param }

    it { expect(assigns(:event)).to eq(event) }
  end

  describe '#create' do
    let(:call_request) { post :create, event: valid_attributes }
    before { post :create, event: valid_attributes }

    context 'with valid params' do
      it { expect {call_request}.to change(Event, :count).by(1) }

      context 'with request' do
        before { call_request }

        it { expect(assigns(:event)).to be_a(Event) }
        it { expect(assigns(:event)).to be_persisted }
        it { expect(response).to redirect_to(Event.last) }
      end
    end

    describe 'with invalid params' do
      before do
        allow_any_instance_of(Event).to receive(:save).and_return(false)
        call_request
      end

      it { expect(assigns(:event)).to be_a_new(Event) }
      it { expect(response).to render_template('new') }
    end
  end

  describe '#update' do
    let(:call_request) { put :update, id: event.to_param, event: valid_attributes }

    describe 'with valid params' do
      context 'expect request' do
        after { call_request }

        it { expect_any_instance_of(Event).to receive(:update).with(valid_attributes) }
      end

      context 'with request' do
        before { call_request }

        it { expect(assigns(:event)).to eq(event) }
        it { expect(response).to redirect_to(event) }
      end
    end

    describe 'with invalid params' do
      before do
        allow_any_instance_of(Event).to receive(:save).and_return(false)
        call_request
      end

      it { expect(assigns(:event)).to eq(event) }
      it { expect(response).to render_template('edit') }
    end
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: event.to_param }
    before { event }

    it { expect{call_request}.to change(Event, :count).by(-1) }

    context 'with request' do
      before { call_request }

      it { expect(response).to redirect_to(events_url) }
    end
  end
end
