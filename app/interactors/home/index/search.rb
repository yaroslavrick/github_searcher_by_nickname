# frozen_string_literal: true

module Home
  module Index
    class Search < BaseInteractor
      require 'faraday'
      require 'faraday/net_http'
      LINK = 'https://api.github.com/users/'
      GH_TOKEN = ENV.fetch('GH_TOKEN', nil) || Rails.application.credentials.dig(:github, :token)

      def call
        check_gh_token_presence!
        perform_search
      rescue Faraday::Error => e
        handle_error(I18n.t('errors.search.network_error', message: e.message))
      rescue JSON::ParserError => e
        handle_error(I18n.t('errors.search.json_parsing_error', message: e.message))
      end

      private

      def perform_search
        context.user_name = github_user_name
        context.user_repos = github_user_repos
        context.semantic_status = 200
      end

      def check_gh_token_presence!
        return if GH_TOKEN.present?

        handle_error(I18n.t('errors.search.gh_token_not_found'))
      end

      def github_user_name
        response_get_name = get_request("#{LINK}#{context.name}")
        JSON.parse(response_get_name.body)['name']
      end

      def github_user_repos
        response_get_repos = get_request("#{LINK}#{context.name}/repos")
        body = JSON.parse(response_get_repos.body)
        if body.is_a?(Hash) && body['message'] == 'Not Found'
          return context.fail!(errors: I18n.t('errors.search.user_not_found'),
                               semantic_status: 404)
        end

        body.pluck('name')
      end

      def get_request(url)
        Faraday.get(url) do |req|
          req.headers['Authorization'] = "token #{GH_TOKEN}"
        end
      end

      def handle_error(errors)
        context.fail!(errors:, semantic_status: 422)
      end
    end
  end
end
