require 'spec_helper'

describe EventsController do
  let(:user) { create(:user) }
  before { sign_in user }

  describe '#index' do
    context 'one event exists' do
      let!(:event) { create(:event, creator: user) }

      context 'after request' do
        before { get :index }

        it { expect(controller.events).to eq([event]) }
      end
    end
  end

  describe '#show' do
    context 'one event exists' do
      let!(:event) { create(:event, creator: user) }

      context 'after request' do
        before { get :show, id: event.to_param }

        it { expect(controller.event).to eq(event) }
      end
    end
  end

  describe '#new' do
    context 'after request' do
      before { get :new }

      it { expect(controller.event).to be_a_new(Event) }
    end
  end

  describe '#edit' do
    context 'one event exists' do
      let!(:event) { create(:event, creator: user) }

      context 'after request' do
        before { get :edit, id: event.to_param }

        it { expect(controller.event).to eq(event) }
      end
    end
  end

  describe '#create' do
    let(:call_request) { post :create, event: attributes }

    context 'with valid params' do
      let(:attributes) { attributes_for(:event) }

      it { expect { call_request }.to change { Event.count }.by(1) }

      context 'after request' do
        before { call_request }

        it { expect(controller.event).to be_a(Event) }
        it { expect(controller.event).to be_persisted }
        it { expect(response).to redirect_to(Event.last) }
      end
    end

    describe 'with invalid params' do
      let(:attributes) { {event: {}} }

      it { expect { call_request }.to_not change { Event.count }.by(1) }

      context 'after request' do
        before { call_request }

        it { expect(controller.event).to be_a_new(Event) }
        it { expect(response).to render_template('new') }
      end
    end
  end
end
