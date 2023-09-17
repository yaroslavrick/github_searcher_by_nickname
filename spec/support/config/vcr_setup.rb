# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :faraday
  config.configure_rspec_metadata!
  config.default_cassette_options = { match_requests_on: %i[method uri body], record: :new_episodes }
  config.allow_http_connections_when_no_cassette = true
  config.ignore_localhost = false

  gh_token = ENV.fetch('GH_TOKEN', nil) || Rails.application.credentials.dig(:github, :token)

  config.filter_sensitive_data('<GH_TOKEN>') { gh_token }
  config.filter_sensitive_data('<BASIC_AUTH>') do
    Base64.strict_encode64("#{gh_token}:X-OAuth-Scopes")
  end
end
