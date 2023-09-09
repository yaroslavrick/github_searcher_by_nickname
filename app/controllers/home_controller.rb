# frozen_string_literal: true

class HomeController < ApplicationController
  require 'faraday'
  require 'faraday/net_http'
  LINK = 'https://api.github.com/users/'

  def index; end

  def search
    @user_name = params[:name]
    github_user_name
    github_user_repos
  end

  private

  def github_user_name
    response_get_name = Faraday.get("#{LINK}#{@user_name}")
    @github_name = JSON.parse(response_get_name.body)['name']
    @github_name
  end

  def github_user_repos
    response_get_repos = Faraday.get("#{LINK}#{@user_name}/repos")
    @github_repos = JSON.parse(response_get_repos.body).pluck('name')
    @github_repos
  end
end
