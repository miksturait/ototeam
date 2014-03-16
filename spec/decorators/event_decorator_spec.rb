require 'spec_helper'

describe EventDecorator do
  let(:event) { create(:event) }
  subject { event.decorate }

  describe '#limit_label' do
    context 'no limits defined' do
      let(:event) { create(:event, attendees_min_count: nil, attendees_max_count: nil) }

      it { expect(subject.limit_label).to eql '* - *' }
    end

    context 'limits are defined' do
      let(:event) { create(:event, attendees_min_count: 5, attendees_max_count: 8) }

      it { expect(subject.limit_label).to eql '5 - 8' }
    end
  end

  describe '#attendances_count' do
    before { create(:attendance, event: subject, friend: create(:friend)) }

    its(:attendances_count) { should eql 1 }
  end
end
