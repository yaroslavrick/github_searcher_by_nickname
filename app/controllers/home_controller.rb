# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def search
    result = Home::Search::Organizer.call(name: search_params[:name])

    if result.success?
      @github_name = result.github_user_name
      @github_repos = result.github_user_repos
    else
      handle_error(result, :search)
    end
  end

  private

  def search_params
    params.permit(:name)
  end

  def handle_error(result, action)
    flash.now[:alert] = result.errors
    render action, status: result.semantic_status || 400
  end
end
