require 'spec_helper'

describe Friend do
  describe '#group_names' do
    let(:group) { create(:group, name: 'testowa') }
    before { subject.groups << group }

    its(:group_names) { should eql 'testowa' }
  end

  describe '#attendance_percentage' do
    its(:attendance_percentage) { should eql '50%' }
  end
end
