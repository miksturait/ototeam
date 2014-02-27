require 'spec_helper'

describe SlidesController do
  describe '#index' do
    before { get :index }

    it { expect(response).to be_success }
  end

  describe '#show' do
    context 'id is valid' do
      before { get :show, id: '2014-02-24_1_Witamy' }

      it { expect(response).to be_success }
    end

    context 'id is invalid' do
      before { get :show, id: '' }

      it { expect(response).to redirect_to(slides_path) }
    end
  end
end
