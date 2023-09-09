# frozen_string_literal: true

module Home
  module Search
    class Search < BaseInteractor
      require 'faraday'
      require 'faraday/net_http'
      LINK = 'https://api.github.com/users/'

      def call
        context.github_user_name = github_user_name
        context.github_user_repos = github_user_repos
      end

      def github_user_name
        response_get_name = Faraday.get("#{LINK}#{context.name}")
        JSON.parse(response_get_name.body)['name']
      end

      def github_user_repos
        response_get_repos = Faraday.get("#{LINK}#{context.name}/repos")
        JSON.parse(response_get_repos.body).pluck('name')
      end
    end
  end
end
