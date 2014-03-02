require 'spec_helper'

describe Group do
  subject { create(:group) }

  describe '#friends_count' do
    its(:friends_count) { should eql 0 }
  end
end
