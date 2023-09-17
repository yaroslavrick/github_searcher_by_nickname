# frozen_string_literal: true

RSpec.describe '/home' do
  describe 'GET /home' do
    it 'returns http success' do
      get '/home'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show', vcr: { cassette_name: 'home/show' } do
    let(:name) { 'dhh' }

    it 'returns http success' do
      get "/home?name=#{name}&commit=Search"
      expect(response).to have_http_status(:success)
    end
  end
end
