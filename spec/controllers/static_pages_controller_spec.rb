require "rails_helper"

RSpec.describe StaticPagesController do
  describe '.home' do
    it 'calls home route' do
      get :home

      expect(response.status).to eq(200)
    end
  end
end
