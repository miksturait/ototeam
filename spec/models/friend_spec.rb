require 'spec_helper'

describe Friend do
  describe '#group_names' do
    its(:group_names) { should eql 'Piłka, Bar' }
  end

  describe '#attendance_percentage' do
    its(:attendance_percentage) { should eql '50%' }
  end
end
