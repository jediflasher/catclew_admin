require 'rails_helper'

RSpec.describe GameDataController, :type => :controller do

  describe 'GET dict' do
    it 'when respond success' do
      get :dict
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET state' do
    it 'when respond success' do
      get :state
      expect(response).to have_http_status(:success)
    end
  end

end
