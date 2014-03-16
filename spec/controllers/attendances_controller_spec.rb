require 'spec_helper'

describe AttendancesController do
  let(:event) { create(:event, :with_creator) }
  let(:friend) { create(:friend, creator: user) }
  let(:user) { event.creator }
  before { sign_in user }

  describe '#index' do
    context 'one attendance exists' do
      let!(:attendance) { create(:attendance, friend: friend, event: event) }

      context 'after request' do
        before { get :index, event_id: event.id }

        it { expect(controller.attendances).to eq([attendance]) }
      end
    end
  end

  describe '#create' do
    let(:attributes) { { friend_id: friend.id } }
    let(:call_request) { post :create, event_id: event.id, attendance: attributes }

    it { expect { call_request }.to change { Attendance.count }.by(1) }
  end


  describe '#destroy' do
    let!(:attendance) { create(:attendance, friend: friend, event: event) }
    let(:call_request) { delete :destroy, event_id: event.id, id: attendance.id }

    it { expect { call_request }.to change { Attendance.count }.by(-1) }
  end
end
