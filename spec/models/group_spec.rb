require 'spec_helper'

describe Group do
  subject { create(:group) }

  describe '#friends_count' do
    let(:friend) { create(:friend) }
    before { subject.friends << friend }

    its(:friends_count) { should eql 1 }
  end
end
