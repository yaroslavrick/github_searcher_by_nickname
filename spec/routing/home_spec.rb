# frozen_string_literal: true

RSpec.describe HomeController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/home').to route_to('home#index')
    end
  end
end
