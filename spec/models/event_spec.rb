require 'spec_helper'

describe Event do
  subject { create(:event) }

  describe '#attendees_count' do
    its(:attendees_count) { should eql 0 }
  end
end
